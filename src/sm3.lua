---
--- SM3
---
--- 支持摘要计算
---
--- Author: 尼维沙·纳默帝敖
---


sm3 = {}

local lib = require("lib")

---
--- 摘要计算
---
--- plain: 原文字符串
---
--- return: 十六进制字符串
function sm3.digest(plain)
    return lib.wsm.sm3_digest(plain)
end

return sm3