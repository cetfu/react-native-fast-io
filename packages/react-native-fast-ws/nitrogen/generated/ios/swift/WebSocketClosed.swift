///
/// WebSocketClosed.swift
/// Sat Oct 05 2024
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

import NitroModules

/**
 * Represents an instance of `WebSocketClosed`, backed by a C++ struct.
 */
public typealias WebSocketClosed = margelo.nitro.grabbou.WebSocketClosed

public extension WebSocketClosed {
  private typealias bridge = margelo.nitro.grabbou.bridge.swift

  /**
   * Create a new instance of `WebSocketClosed`.
   */
  init(code: Double, reason: String) {
    self.init(code, std.string(reason))
  }

  var code: Double {
    @inline(__always)
    get {
      return self.__code
    }
    @inline(__always)
    set {
      self.__code = newValue
    }
  }
  
  var reason: String {
    @inline(__always)
    get {
      return String(self.__reason)
    }
    @inline(__always)
    set {
      self.__reason = std.string(newValue)
    }
  }
}
