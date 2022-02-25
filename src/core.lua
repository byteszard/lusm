core = {}

local lib_path = "../lib/wsm4l.so"

package.cpath = package.cpath .. ";" .. lib_path

core.wsm = require("wsm4l")

return core