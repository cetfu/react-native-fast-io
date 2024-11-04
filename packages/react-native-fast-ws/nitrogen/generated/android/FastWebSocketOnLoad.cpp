///
/// FastWebSocketOnLoad.cpp
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

#include "FastWebSocketOnLoad.hpp"

#include <jni.h>
#include <fbjni/fbjni.h>
#include <NitroModules/HybridObjectRegistry.hpp>

#include "JHybridWebSocketSpec.hpp"
#include "JFunc_void_std__string.hpp"
#include "JFunc_void_double_std__string.hpp"
#include "JFunc_void_std__shared_ptr_ArrayBuffer_.hpp"
#include "JHybridWebSocketManagerSpec.hpp"
#include <NitroModules/JNISharedPtr.hpp>

namespace margelo::nitro::websocket {

int initialize(JavaVM* vm) {
  using namespace margelo::nitro;
  using namespace margelo::nitro::websocket;
  using namespace facebook;

  return facebook::jni::initialize(vm, [] {
    // Register native JNI methods
    margelo::nitro::websocket::JHybridWebSocketSpec::registerNatives();
    margelo::nitro::websocket::JFunc_void_std__string::registerNatives();
    margelo::nitro::websocket::JFunc_void_double_std__string::registerNatives();
    margelo::nitro::websocket::JFunc_void_std__string::registerNatives();
    margelo::nitro::websocket::JFunc_void_std__string::registerNatives();
    margelo::nitro::websocket::JFunc_void_std__shared_ptr_ArrayBuffer_::registerNatives();
    margelo::nitro::websocket::JHybridWebSocketManagerSpec::registerNatives();

    // Register Nitro Hybrid Objects
    HybridObjectRegistry::registerHybridObjectConstructor(
      "WebSocketManager",
      []() -> std::shared_ptr<HybridObject> {
        static auto javaClass = jni::findClassStatic("com/margelo/nitro/websocket/HybridWebSocketManager");
        static auto defaultConstructor = javaClass->getConstructor<JHybridWebSocketManagerSpec::javaobject()>();
    
        auto instance = javaClass->newObject(defaultConstructor);
    #ifdef NITRO_DEBUG
        if (instance == nullptr) [[unlikely]] {
          throw std::runtime_error("Failed to create an instance of \"JHybridWebSocketManagerSpec\" - the constructor returned null!");
        }
    #endif
        auto globalRef = jni::make_global(instance);
        return JNISharedPtr::make_shared_from_jni<JHybridWebSocketManagerSpec>(globalRef);
      }
    );
  });
}

} // namespace margelo::nitro::websocket