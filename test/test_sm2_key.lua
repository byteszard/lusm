---
--- SM2批量生成随机秘钥对
---
package.path = package.path .. ";../src/?.lua"

local sm2 = require("sm2")

local batch = 100000

--- 本地初步测试 10万个秘钥对， 耗时：37秒
function batch_generate_keys(n)
    i = 1
    repeat
        --local private, public = sm2.generate_key()
        sm2.generate_keypair()
        if i % 10000 == 0 then
            print(i // 10000 .. "w : " .. os.date("%H:%M:%S"))
        end
        i = i + 1
    until (i > n)
end

print("-----------SM2: 批量生成秘钥对-----------")
print("开始：" .. os.date("%H:%M:%S"))
local s = os.time()

batch_generate_keys(batch)

print("结束：" .. os.date("%H:%M:%S"))
local c = os.difftime(os.time(), s)
print("耗时:" .. c .. "秒")

