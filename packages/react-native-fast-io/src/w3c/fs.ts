import { FileSystem, Metadata } from '../native/fs.nitro'
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
  nativeStream: ReadableStream<Uint8Array>

  constructor({ name, path, size, lastModified }: Metadata) {
    const inputStream = FileSystem.createInputStream(path)

    super([], name, {
      lastModified,
    })

    this.nativeStream = toReadableStream(inputStream)
    this._size = size
  }

  stream() {
    return this.nativeStream
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
    this.#metadata = FileSystem.getFileMetadata(path)
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
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  options?: OpenFilePickerOptions
): Promise<FileSystemFileHandle[]> {
  const paths = await FileSystem.showOpenFilePicker()
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
