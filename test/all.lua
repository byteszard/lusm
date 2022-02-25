---
--- 测试用例
---
package.path = package.path .. ";../src/?.lua"

local sm2 = require("sm2")
local sm3 = require("sm3")
local sm4 = require("sm4")

print()
print("-----------SM2: 批量生成秘钥对-----------")
function batch_generate_keys(n)
    i = 1
    repeat
        local private, public = sm2.generate_key()
        print("(" .. private .. "," .. public .. ")")
        i = i + 1
    until (i > n)
end

batch_generate_keys(10)

local prk = "6aea1ccf610488aaa7fddba3dd6d76d3bdfd50f957d847be3d453defb695f28e"
local puk = "04a8af64e38eea41c254df769b5b41fbaa2d77b226b301a2636d463c52b46c777230ad1714e686dd641b9e04596530b38f6a64215b0ed3b081f8641724c5443a6e"

print()
print("-----------SM2: 加密解密(c1c3c2)-----------")
local plain1 = "圣光会抛弃你的，英雄，就像抛弃我那样。——巫妖王"
local cipher1 = sm2.encrypt(puk, plain1)
local text1 = sm2.decrypt(prk, cipher1)
print("明文：" .. plain1)
print("密文：" .. cipher1)
print("解密：" .. text1)
assert(text1, plain1)

print()
print("-----------SM2: 加密解密(c1c2c3)-----------")
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

print()
print("-----------SM3: 计算摘要-----------")
local plain4 = "abc"
local hash = sm3.digest(plain4)
print("原文：" .. plain4)
print("摘要：" .. hash)
assert(hash, "66c7f0f462eeedd9d1f2d46bdc10e4e24167c4875cf2f7a2297da02b8f4ba8e0")

print()
print("-----------SM4: 加密解密-----------")
local key = sm4.generate_key()
local iv = sm4.generate_iv()
print()
print("-----------SM4: ECB Mode-----------")
local ecb_cipher = sm4.encrypt_ecb(key, plain1)
local ecb_text = sm4.decrypt_ecb(key, ecb_cipher)
print("明文：" .. plain1)
print("密文：" .. ecb_cipher)
print("解密：" .. ecb_text)
assert(plain1, ecb_text)

print()
print("-----------SM4: CBC Mode-----------")
local cbc_cipher = sm4.encrypt_cbc(key, iv, plain2)
local cbc_text = sm4.decrypt_cbc(key, iv, cbc_cipher)
print("明文：" .. plain2)
print("密文：" .. cbc_cipher)
print("解密：" .. cbc_text)
assert(plain2, cbc_text)

print()
print("-----------SM4: CFB Mode-----------")
local cfb_cipher = sm4.encrypt_cfb(key, iv, plain3)
local cfb_text = sm4.decrypt_cfb(key, iv, cfb_cipher)
print("明文：" .. plain3)
print("密文：" .. cfb_cipher)
print("解密：" .. cfb_text)
assert(plain3, cfb_text)

print()
print("-----------SM4: OFB Mode-----------")
local ofb_cipher = sm4.encrypt_ofb(key, iv, plain2)
local ofb_text = sm4.decrypt_ofb(key, iv, ofb_cipher)
print("明文：" .. plain2)
print("密文：" .. ofb_cipher)
print("解密：" .. ofb_text)
assert(plain2, ofb_text)

print()
print("-----------SM4: CTR Mode-----------")
local ctr_cipher = sm4.encrypt_ctr(key, iv, plain1)
local ctr_text = sm4.decrypt_ctr(key, iv, ctr_cipher)
print("明文：" .. plain1)
print("密文：" .. ctr_cipher)
print("解密：" .. ctr_text)
assert(plain1, ctr_text)