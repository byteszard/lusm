lib = {}

local wsm4l = "../lib/wsm4l.so"

package.cpath = package.cpath .. ";" .. wsm4l

lib.wsm = require("wsm4l")

return lib