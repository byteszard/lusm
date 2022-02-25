---
--- SM3测试用例
---
package.path = package.path .. ";../src/?.lua"

local sm3 = require("sm3")

print()
print("-----------SM3: 计算摘要-----------")
local plain = "abc"
local hash = sm3.digest(plain)
print("原文：" .. plain)
print("摘要：" .. hash)
assert(hash, "66c7f0f462eeedd9d1f2d46bdc10e4e24167c4875cf2f7a2297da02b8f4ba8e0")
