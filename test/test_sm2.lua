---
--- SM2测试用例
---
package.path = package.path .. ";../src/?.lua"

local sm2 = require("sm2")

print()
print("-----------SM2: 随机秘钥对-----------")
local prk, puk = sm2.generate_keypair()
print("私钥：" .. prk)
print("公钥：" .. puk)

print()
print("-----------SM2: 加解密(c1c3c2)-----------")
local plain1 = "圣光会抛弃你的，英雄，就像抛弃我那样。——巫妖王"
local cipher1 = sm2.encrypt(puk, plain1)
local text1 = sm2.decrypt(prk, cipher1)
print("明文：" .. plain1)
print("密文：" .. cipher1)
print("解密：" .. text1)
assert(text1, plain1)

print()
print("-----------SM2: 加解密(c1c2c3)-----------")
local plain2 = "兽人永不为奴，我们终将成王。——加尔鲁什·地狱咆哮"
local cipher2 = sm2.encrypt_c1c2c3(puk, plain2)
local text2 = sm2.decrypt_c1c2c3(prk, cipher2)
print("明文：" .. plain2)
print("密文：" .. cipher2)
print("解密：" .. text2)
assert(text2, plain2)

print()
print("-----------SM2: 签名和验签-----------")
local plain3 = "没人生来杰出（No one breather who is worthier）——奥格瑞姆·毁灭之锤"
local signature = sm2.sign(prk, puk, plain3)
local valid = sm2.verify(puk, plain3, signature)
print("原文：" .. plain3)
print("签名：" .. signature)
if (valid) then
    print("验签: 通过")
else
    print("验签: 不通过")
end
assert(valid, true)