///
/// HybridWebSocketManagerSpec.swift
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

import Foundation
import NitroModules

/**
 * A Swift protocol representing the WebSocketManager HybridObject.
 * Implement this protocol to create Swift-based instances of WebSocketManager.
 *
 * When implementing this protocol, make sure to initialize `hybridContext` - example:
 * ```
 * public class HybridWebSocketManager : HybridWebSocketManagerSpec {
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
public protocol HybridWebSocketManagerSpec: AnyObject, HybridObjectSpec {
  // Properties
  

  // Methods
  func create(url: String, protocols: [String]) throws -> (any HybridWebSocketSpec)
}
