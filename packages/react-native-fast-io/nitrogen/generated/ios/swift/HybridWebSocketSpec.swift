///
/// HybridWebSocketSpec.swift
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

import Foundation
import NitroModules

/**
 * A Swift protocol representing the WebSocket HybridObject.
 * Implement this protocol to create Swift-based instances of WebSocket.
 *
 * When implementing this protocol, make sure to initialize `hybridContext` - example:
 * ```
 * public class HybridWebSocket : HybridWebSocketSpec {
 *   // Initialize HybridContext
 *   var hybridContext = margelo.nitro.HybridContext()
 *
 *   // Return size of the instance to inform JS GC about memory pressure
 *   var memorySize: Int {
 *     return getSizeOf(self)
 *   }
 *
 *   // ...
 * }
 * ```
 */
public protocol HybridWebSocketSpec: AnyObject, HybridObjectSpec {
  // Properties
  

  // Methods
  func send(message: String) throws -> Void
  func sendArrayBuffer(buffer: ArrayBufferHolder) throws -> Void
  func connect() throws -> Void
  func close(code: Double, reason: String) throws -> Void
  func ping() throws -> Void
  func onOpen(callback: @escaping ((_ selectedProtocol: String) -> Void)) throws -> Void
  func onClose(callback: @escaping ((_ code: Double, _ reason: String) -> Void)) throws -> Void
  func onError(callback: @escaping ((_ error: String) -> Void)) throws -> Void
  func onMessage(callback: @escaping ((_ message: String) -> Void)) throws -> Void
  func onArrayBuffer(callback: @escaping ((_ buffer: ArrayBufferHolder) -> Void)) throws -> Void
}
