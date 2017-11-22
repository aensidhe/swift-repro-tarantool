#!/usr/bin/env tarantool

local swift_module_name = 'test_loading_library'

-- module search paths for box.schema.func.create
require('log').info(package.cpath)

local folder = 'data_fail'
os.execute("mkdir -p "..folder)

-- init tarantool
box.cfg {
    listen = 3301,
    wal_dir = folder,
    memtx_dir = folder,
    vinyl_dir = folder,
    memtx_memory=209715200 -- limit memory to 200mb to run on cheap virtual servers
}

box.schema.user.grant('guest', 'read,write,execute', 'universe', nil, { if_not_exists = true })

-- init swift module
swift = require(swift_module_name)

-- 1. native way
box.schema.func.create('hello_swift_native', {language = "C", if_not_exists = true})

require('console').start()
