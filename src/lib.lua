lib = {}

local wsm4l = "../lib/libwsm4l.so"

package.cpath = package.cpath .. ";" .. wsm4l

lib.wsm = require("libwsm4l")

return lib