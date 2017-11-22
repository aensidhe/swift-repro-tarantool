# How to run

Build and run container:
````
docker build . -t test_tarantool && docker run --rm -it test_tarantool
````

To try code with failure on module loading:
````
tarantool /usr/local/share/tarantool/tarantool_fail.lua
````

To try code with ok on module loading:
````
tarantool /usr/local/share/tarantool/tarantool_ok.lua
````

After tarantool launches copy-paste code from [test.lua](https://github.com/aensidhe/swift-repro-tarantool/blob/master/tarantool/test.lua) (since we can't still call native methods from console).

The only difference is these rows:
````
local swift_module_name = 'libtest_loading_library'

package.cpath = '/usr/local/lib/tarantool/'..swift_module_name..'.so;'..package.cpath
````

If we change [this line](https://github.com/aensidhe/swift-repro-tarantool/blob/95fa76798afb177fc93148e20076c2601624a293/tarantool/tarantool_fail.lua#L23) to `require('test_loading_library')` then `tarantool_ok` will still work, but `tarantool_fail` will fail to even load the module.
