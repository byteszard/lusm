---
--- 测试用例
---
package.path = package.path .. ";../src/?.lua"

local sm4 = require("sm4")

local plain1 = "圣光会抛弃你的，英雄，就像抛弃我那样。——巫妖王"
local plain2 = "兽人永不为奴，我们终将成王。——加尔鲁什·地狱咆哮"
local plain3 = "没人生来杰出（No one breather who is worthier）——奥格瑞姆·毁灭之锤"

local key = sm4.generate_key()
local iv = sm4.generate_iv()

print()
print("--------------SM4: ECB Mode--------------")
local ecb_cipher = sm4.encrypt_ecb(key, plain1)
local ecb_text = sm4.decrypt_ecb(key, ecb_cipher)
print("明文：" .. plain1)
print("密文：" .. ecb_cipher)
print("解密：" .. ecb_text)
assert(plain1, ecb_text)

print()
print("--------------SM4: CBC Mode--------------")
local cbc_cipher = sm4.encrypt_cbc(key, iv, plain2)
local cbc_text = sm4.decrypt_cbc(key, iv, cbc_cipher)
print("明文：" .. plain2)
print("密文：" .. cbc_cipher)
print("解密：" .. cbc_text)
assert(plain2, cbc_text)

print()
print("--------------SM4: CFB Mode--------------")
local cfb_cipher = sm4.encrypt_cfb(key, iv, plain3)
local cfb_text = sm4.decrypt_cfb(key, iv, cfb_cipher)
print("明文：" .. plain3)
print("密文：" .. cfb_cipher)
print("解密：" .. cfb_text)
assert(plain3, cfb_text)

print()
print("--------------SM4: OFB Mode--------------")
local ofb_cipher = sm4.encrypt_ofb(key, iv, plain2)
local ofb_text = sm4.decrypt_ofb(key, iv, ofb_cipher)
print("明文：" .. plain2)
print("密文：" .. ofb_cipher)
print("解密：" .. ofb_text)
assert(plain2, ofb_text)

print()
print("--------------SM4: CTR Mode--------------")
local ctr_cipher = sm4.encrypt_ctr(key, iv, plain1)
local ctr_text = sm4.decrypt_ctr(key, iv, ctr_cipher)
print("明文：" .. plain1)
print("密文：" .. ctr_cipher)
print("解密：" .. ctr_text)
assert(plain1, ctr_text)