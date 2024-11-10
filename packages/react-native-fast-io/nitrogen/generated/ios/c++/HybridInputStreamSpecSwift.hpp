///
/// HybridInputStreamSpecSwift.hpp
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

#pragma once

#include "HybridInputStreamSpec.hpp"

// Forward declaration of `HybridInputStreamSpecCxx` to properly resolve imports.
namespace FastIO { class HybridInputStreamSpecCxx; }

// Forward declaration of `ArrayBuffer` to properly resolve imports.
namespace NitroModules { class ArrayBuffer; }
// Forward declaration of `ArrayBufferHolder` to properly resolve imports.
namespace NitroModules { class ArrayBufferHolder; }

#include <NitroModules/ArrayBuffer.hpp>
#include <NitroModules/ArrayBufferHolder.hpp>

#if __has_include(<NitroModules/HybridContext.hpp>)
#include <NitroModules/HybridContext.hpp>
#else
#error NitroModules cannot be found! Are you sure you installed NitroModules properly?
#endif

#include "FastIO-Swift-Cxx-Umbrella.hpp"

namespace margelo::nitro::fastio {

  /**
   * The C++ part of HybridInputStreamSpecCxx.swift.
   *
   * HybridInputStreamSpecSwift (C++) accesses HybridInputStreamSpecCxx (Swift), and might
   * contain some additional bridging code for C++ <> Swift interop.
   *
   * Since this obviously introduces an overhead, I hope at some point in
   * the future, HybridInputStreamSpecCxx can directly inherit from the C++ class HybridInputStreamSpec
   * to simplify the whole structure and memory management.
   */
  class HybridInputStreamSpecSwift: public virtual HybridInputStreamSpec {
  public:
    // Constructor from a Swift instance
    explicit HybridInputStreamSpecSwift(const FastIO::HybridInputStreamSpecCxx& swiftPart):
      HybridObject(HybridInputStreamSpec::TAG),
      _swiftPart(swiftPart) { }

  public:
    // Get the Swift part
    inline FastIO::HybridInputStreamSpecCxx getSwiftPart() noexcept { return _swiftPart; }

  public:
    // Get memory pressure
    inline size_t getExternalMemorySize() noexcept override {
      return _swiftPart.getMemorySize();
    }

  public:
    // Properties
    

  public:
    // Methods
    inline bool hasBytesAvailable() override {
      auto __result = _swiftPart.hasBytesAvailable();
      return __result;
    }
    inline double read(const std::shared_ptr<ArrayBuffer>& buffer, double maxLength) override {
      auto __result = _swiftPart.read(ArrayBufferHolder(buffer), std::forward<decltype(maxLength)>(maxLength));
      return __result;
    }
    inline void open() override {
      _swiftPart.open();
    }
    inline void close() override {
      _swiftPart.close();
    }

  private:
    FastIO::HybridInputStreamSpecCxx _swiftPart;
  };

} // namespace margelo::nitro::fastio