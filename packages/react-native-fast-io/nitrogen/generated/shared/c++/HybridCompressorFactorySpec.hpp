///
/// HybridCompressorFactorySpec.hpp
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

#pragma once

#if __has_include(<NitroModules/HybridObject.hpp>)
#include <NitroModules/HybridObject.hpp>
#else
#error NitroModules cannot be found! Are you sure you installed NitroModules properly?
#endif

// Forward declaration of `HybridCompressorSpec` to properly resolve imports.
namespace margelo::nitro::fastio { class HybridCompressorSpec; }
// Forward declaration of `CompressionAlgorithm` to properly resolve imports.
namespace margelo::nitro::fastio { enum class CompressionAlgorithm; }

#include <memory>
#include "HybridCompressorSpec.hpp"
#include "CompressionAlgorithm.hpp"

namespace margelo::nitro::fastio {

  using namespace margelo::nitro;

  /**
   * An abstract base class for `CompressorFactory`
   * Inherit this class to create instances of `HybridCompressorFactorySpec` in C++.
   * You must explicitly call `HybridObject`'s constructor yourself, because it is virtual.
   * @example
   * ```cpp
   * class HybridCompressorFactory: public HybridCompressorFactorySpec {
   * public:
   *   HybridCompressorFactory(...): HybridObject(TAG) { ... }
   *   // ...
   * };
   * ```
   */
  class HybridCompressorFactorySpec: public virtual HybridObject {
    public:
      // Constructor
      explicit HybridCompressorFactorySpec(): HybridObject(TAG) { }

      // Destructor
      virtual ~HybridCompressorFactorySpec() { }

    public:
      // Properties
      

    public:
      // Methods
      virtual std::shared_ptr<margelo::nitro::fastio::HybridCompressorSpec> create(CompressionAlgorithm algorithm) = 0;

    protected:
      // Hybrid Setup
      void loadHybridMethods() override;

    protected:
      // Tag for logging
      static constexpr auto TAG = "CompressorFactory";
  };

} // namespace margelo::nitro::fastio