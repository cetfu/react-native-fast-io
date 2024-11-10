///
/// HybridInputStreamSpec.swift
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

import Foundation
import NitroModules

/**
 * A Swift protocol representing the InputStream HybridObject.
 * Implement this protocol to create Swift-based instances of InputStream.
 *
 * When implementing this protocol, make sure to initialize `hybridContext` - example:
 * ```
 * public class HybridInputStream : HybridInputStreamSpec {
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
public protocol HybridInputStreamSpec: AnyObject, HybridObjectSpec {
  // Properties
  

  // Methods
  func hasBytesAvailable() throws -> Bool
  func read(buffer: ArrayBufferHolder, maxLength: Double) throws -> Double
  func open() throws -> Void
  func close() throws -> Void
}