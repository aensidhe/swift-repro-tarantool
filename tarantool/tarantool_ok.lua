#!/usr/bin/env tarantool

local swift_module_name = 'test_loading_library'

package.cpath = '/usr/local/lib/tarantool/lib'..swift_module_name..'.so;'..package.cpath

-- usual code is invoked
require('tarantool_fail')
