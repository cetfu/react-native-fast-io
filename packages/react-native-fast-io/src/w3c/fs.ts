import { FileSystem, Metadata, NativeFilePickerOptions } from '../native/fs.nitro'
import { StreamFactory } from '../native/streams.nitro'
import {
  DirectoryPickerOptions,
  FileExtension,
  OpenFilePickerOptions,
  SaveFilePickerOptions,
} from '../types/fs'
import { Blob } from './blob'
import { toReadableStream } from './streams'

export class File extends Blob implements globalThis.File {
  name: string
  lastModified: number

  constructor(fileBits: BlobPart[], name: string, options: FilePropertyBag = {}) {
    super(fileBits, options)
    this.name = name
    this.lastModified = options.lastModified ?? Date.now()
  }

  get [Symbol.toStringTag](): string {
    return 'File'
  }

  get webkitRelativePath(): string {
    throw new Error('Not implemented')
  }
}

class NativeFile extends File {
  #path: string

  constructor({ name, path, type, size, lastModified }: Metadata) {
    super([], name, {
      lastModified,
      type,
    })

    this.#path = path
    this._size = size
  }

  stream() {
    const nativeStream = StreamFactory.createInputStream(this.#path)
    return toReadableStream(nativeStream)
  }

  get [Symbol.toStringTag](): string {
    return 'File'
  }
}

class FileSystemFileHandle implements globalThis.FileSystemFileHandle {
  readonly kind = 'file'

  get name(): string {
    return this.#metadata.name
  }

  #metadata: Metadata

  constructor(path: string) {
    this.#metadata = FileSystem.getMetadata(path)
  }

  async getFile() {
    return new NativeFile(this.#metadata)
  }

  async createWritable(): Promise<FileSystemWritableFileStream> {
    throw new Error('Not implemented')
  }

  async isSameEntry(other: FileSystemHandle): Promise<boolean> {
    return (
      other instanceof FileSystemFileHandle &&
      this.#metadata.root === other.#metadata.root &&
      this.#metadata.path === other.#metadata.path
    )
  }

  get [Symbol.toStringTag](): string {
    return 'FileSystemFileHandle'
  }
}

export async function showOpenFilePicker(
  options: OpenFilePickerOptions = {}
): Promise<FileSystemFileHandle[]> {
  const nativePickerOptions: NativeFilePickerOptions = {}

  if (options.startIn) {
    nativePickerOptions.startIn = FileSystem.getWellKnownDirectoryPath(options.startIn)
  }

  if (options.multiple) {
    nativePickerOptions.multiple = options.multiple
  }

  if (options.types) {
    nativePickerOptions.extensions = options.types.reduce<FileExtension[]>((acc, type) => {
      if (!type.accept) {
        return acc
      }
      return acc.concat(...Object.values(type.accept))
    }, [])
    nativePickerOptions.mimeTypes = options.types.flatMap((type) => Object.keys(type.accept || {}))
  }

  const paths = await FileSystem.showOpenFilePicker(nativePickerOptions)

  return paths.map((path) => new FileSystemFileHandle(path))
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export function showSaveFilePicker(options?: SaveFilePickerOptions): Promise<FileSystemFileHandle> {
  throw new Error('Not implemented')
}

export function showDirectoryPicker(
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  options?: DirectoryPickerOptions
): Promise<FileSystemDirectoryHandle> {
  throw new Error('Not implemented')
}
