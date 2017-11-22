import AsyncTarantool

// called by require('swift_tarantool_module') from tarantool.lua

@_silgen_name("luaopen_libtest_loading_library")
public func open(L: OpaquePointer!) -> Int32 {
    // use tarantool fibers in async
    AsyncTarantool().registerGlobal()

    // 1. you don't need the rest if you only use native way:
    return 0
}
