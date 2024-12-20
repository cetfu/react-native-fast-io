///
/// HybridWebSocketSpecCxx.swift
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

import Foundation
import NitroModules

/**
 * Helper class for converting instances of `HybridWebSocketSpecCxx` from- and to unsafe pointers.
 * This is useful to pass Swift classes to C++, without having to strongly type the C++ function signature.
 * The actual Swift type can be included in the .cpp file, without having to forward-declare anything in .hpp.
 */
public final class HybridWebSocketSpecCxxUnsafe {
  /**
   * Casts a `HybridWebSocketSpecCxx` instance to a retained unsafe raw pointer.
   * This acquires one additional strong reference on the object!
   */
  public static func toUnsafe(_ instance: HybridWebSocketSpecCxx) -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(instance).toOpaque()
  }

  /**
   * Casts an unsafe pointer to a `HybridWebSocketSpecCxx`.
   * The pointer has to be a retained opaque `Unmanaged<HybridWebSocketSpecCxx>`.
   * This removes one strong reference from the object!
   */
  public static func fromUnsafe(_ pointer: UnsafeMutableRawPointer) -> HybridWebSocketSpecCxx {
    return Unmanaged<HybridWebSocketSpecCxx>.fromOpaque(pointer).takeRetainedValue()
  }
}

/**
 * A class implementation that bridges HybridWebSocketSpec over to C++.
 * In C++, we cannot use Swift protocols - so we need to wrap it in a class to make it strongly defined.
 *
 * Also, some Swift types need to be bridged with special handling:
 * - Enums need to be wrapped in Structs, otherwise they cannot be accessed bi-directionally (Swift bug: https://github.com/swiftlang/swift/issues/75330)
 * - Other HybridObjects need to be wrapped/unwrapped from the Swift TCxx wrapper
 * - Throwing methods need to be wrapped with a Result<T, Error> type, as exceptions cannot be propagated to C++
 */
public class HybridWebSocketSpecCxx {
  /**
   * The Swift <> C++ bridge's namespace (`margelo::nitro::fastio::bridge::swift`)
   * from `FastIO-Swift-Cxx-Bridge.hpp`.
   * This contains specialized C++ templates, and C++ helper functions that can be accessed from Swift.
   */
  public typealias bridge = margelo.nitro.fastio.bridge.swift

  /**
   * Holds an instance of the `HybridWebSocketSpec` Swift protocol.
   */
  private var __implementation: any HybridWebSocketSpec

  /**
   * Create a new `HybridWebSocketSpecCxx` that wraps the given `HybridWebSocketSpec`.
   * All properties and methods bridge to C++ types.
   */
  public init(_ implementation: some HybridWebSocketSpec) {
    self.__implementation = implementation
    /* no base class */
  }

  /**
   * Get the actual `HybridWebSocketSpec` instance this class wraps.
   */
  @inline(__always)
  public func getHybridWebSocketSpec() -> any HybridWebSocketSpec {
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
  public func send(message: std.string) -> Void {
    do {
      try self.__implementation.send(message: String(message))
      return 
    } catch {
      let __message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(__message))")
    }
  }
  
  @inline(__always)
  public func sendArrayBuffer(buffer: ArrayBufferHolder) -> Void {
    do {
      try self.__implementation.sendArrayBuffer(buffer: buffer)
      return 
    } catch {
      let __message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(__message))")
    }
  }
  
  @inline(__always)
  public func connect() -> Void {
    do {
      try self.__implementation.connect()
      return 
    } catch {
      let __message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(__message))")
    }
  }
  
  @inline(__always)
  public func close(code: Double, reason: std.string) -> Void {
    do {
      try self.__implementation.close(code: code, reason: String(reason))
      return 
    } catch {
      let __message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(__message))")
    }
  }
  
  @inline(__always)
  public func ping() -> Void {
    do {
      try self.__implementation.ping()
      return 
    } catch {
      let __message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(__message))")
    }
  }
  
  @inline(__always)
  public func onOpen(callback: bridge.Func_void_std__string) -> Void {
    do {
      try self.__implementation.onOpen(callback: { () -> ((String) -> Void) in
        let __sharedClosure = bridge.share_Func_void_std__string(callback)
        return { (__selectedProtocol: String) -> Void in
          __sharedClosure.pointee.call(std.string(__selectedProtocol))
        }
      }())
      return 
    } catch {
      let __message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(__message))")
    }
  }
  
  @inline(__always)
  public func onClose(callback: bridge.Func_void_double_std__string) -> Void {
    do {
      try self.__implementation.onClose(callback: { () -> ((Double, String) -> Void) in
        let __sharedClosure = bridge.share_Func_void_double_std__string(callback)
        return { (__code: Double, __reason: String) -> Void in
          __sharedClosure.pointee.call(__code, std.string(__reason))
        }
      }())
      return 
    } catch {
      let __message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(__message))")
    }
  }
  
  @inline(__always)
  public func onError(callback: bridge.Func_void_std__string) -> Void {
    do {
      try self.__implementation.onError(callback: { () -> ((String) -> Void) in
        let __sharedClosure = bridge.share_Func_void_std__string(callback)
        return { (__error: String) -> Void in
          __sharedClosure.pointee.call(std.string(__error))
        }
      }())
      return 
    } catch {
      let __message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(__message))")
    }
  }
  
  @inline(__always)
  public func onMessage(callback: bridge.Func_void_std__string) -> Void {
    do {
      try self.__implementation.onMessage(callback: { () -> ((String) -> Void) in
        let __sharedClosure = bridge.share_Func_void_std__string(callback)
        return { (__message: String) -> Void in
          __sharedClosure.pointee.call(std.string(__message))
        }
      }())
      return 
    } catch {
      let __message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(__message))")
    }
  }
  
  @inline(__always)
  public func onArrayBuffer(callback: bridge.Func_void_std__shared_ptr_ArrayBuffer_) -> Void {
    do {
      try self.__implementation.onArrayBuffer(callback: { () -> ((ArrayBufferHolder) -> Void) in
        let __sharedClosure = bridge.share_Func_void_std__shared_ptr_ArrayBuffer_(callback)
        return { (__buffer: ArrayBufferHolder) -> Void in
          __sharedClosure.pointee.call(__buffer)
        }
      }())
      return 
    } catch {
      let __message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(__message))")
    }
  }
}
