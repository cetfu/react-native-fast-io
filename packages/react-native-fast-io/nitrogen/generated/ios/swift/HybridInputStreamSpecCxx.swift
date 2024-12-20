///
/// HybridInputStreamSpecCxx.swift
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

import Foundation
import NitroModules

/**
 * Helper class for converting instances of `HybridInputStreamSpecCxx` from- and to unsafe pointers.
 * This is useful to pass Swift classes to C++, without having to strongly type the C++ function signature.
 * The actual Swift type can be included in the .cpp file, without having to forward-declare anything in .hpp.
 */
public final class HybridInputStreamSpecCxxUnsafe {
  /**
   * Casts a `HybridInputStreamSpecCxx` instance to a retained unsafe raw pointer.
   * This acquires one additional strong reference on the object!
   */
  public static func toUnsafe(_ instance: HybridInputStreamSpecCxx) -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(instance).toOpaque()
  }

  /**
   * Casts an unsafe pointer to a `HybridInputStreamSpecCxx`.
   * The pointer has to be a retained opaque `Unmanaged<HybridInputStreamSpecCxx>`.
   * This removes one strong reference from the object!
   */
  public static func fromUnsafe(_ pointer: UnsafeMutableRawPointer) -> HybridInputStreamSpecCxx {
    return Unmanaged<HybridInputStreamSpecCxx>.fromOpaque(pointer).takeRetainedValue()
  }
}

/**
 * A class implementation that bridges HybridInputStreamSpec over to C++.
 * In C++, we cannot use Swift protocols - so we need to wrap it in a class to make it strongly defined.
 *
 * Also, some Swift types need to be bridged with special handling:
 * - Enums need to be wrapped in Structs, otherwise they cannot be accessed bi-directionally (Swift bug: https://github.com/swiftlang/swift/issues/75330)
 * - Other HybridObjects need to be wrapped/unwrapped from the Swift TCxx wrapper
 * - Throwing methods need to be wrapped with a Result<T, Error> type, as exceptions cannot be propagated to C++
 */
public class HybridInputStreamSpecCxx {
  /**
   * The Swift <> C++ bridge's namespace (`margelo::nitro::fastio::bridge::swift`)
   * from `FastIO-Swift-Cxx-Bridge.hpp`.
   * This contains specialized C++ templates, and C++ helper functions that can be accessed from Swift.
   */
  public typealias bridge = margelo.nitro.fastio.bridge.swift

  /**
   * Holds an instance of the `HybridInputStreamSpec` Swift protocol.
   */
  private var __implementation: any HybridInputStreamSpec

  /**
   * Create a new `HybridInputStreamSpecCxx` that wraps the given `HybridInputStreamSpec`.
   * All properties and methods bridge to C++ types.
   */
  public init(_ implementation: some HybridInputStreamSpec) {
    self.__implementation = implementation
    /* no base class */
  }

  /**
   * Get the actual `HybridInputStreamSpec` instance this class wraps.
   */
  @inline(__always)
  public func getHybridInputStreamSpec() -> any HybridInputStreamSpec {
    return __implementation
  }

  /**
   * Contains a (weak) reference to the C++ HybridObject to cache it.
   */
  public var hybridContext: margelo.nitro.HybridContext {
    @inline(__always)
    get {
      return self.__implementation.hybridContext
    }
    @inline(__always)
    set {
      self.__implementation.hybridContext = newValue
    }
  }

  /**
   * Get the memory size of the Swift class (plus size of any other allocations)
   * so the JS VM can properly track it and garbage-collect the JS object if needed.
   */
  @inline(__always)
  public var memorySize: Int {
    return self.__implementation.memorySize
  }

  // Properties
  

  // Methods
  @inline(__always)
  public func read() -> bridge.std__shared_ptr_Promise_std__shared_ptr_ArrayBuffer___ {
    do {
      let __result = try self.__implementation.read()
      return { () -> bridge.std__shared_ptr_Promise_std__shared_ptr_ArrayBuffer___ in
        let __promise = bridge.create_std__shared_ptr_Promise_std__shared_ptr_ArrayBuffer___()
        __result
          .then({ __result in __promise.pointee.resolve(__result.getArrayBuffer()) })
          .catch({ __error in __promise.pointee.reject(__error.toCpp()) })
        return __promise
      }()
    } catch {
      let __message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(__message))")
    }
  }
  
  @inline(__always)
  public func open() -> Void {
    do {
      try self.__implementation.open()
      return 
    } catch {
      let __message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(__message))")
    }
  }
  
  @inline(__always)
  public func close() -> Void {
    do {
      try self.__implementation.close()
      return 
    } catch {
      let __message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(__message))")
    }
  }
}
