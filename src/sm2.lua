---
--- SM2
---
--- 支持公钥加密、私钥解密、签名、验签、秘钥对生成
---
--- Author: 尼维沙·纳默帝敖
---

sm2 = {}

local core = require("core")

--- SM2秘钥对生成函数
---
--- return: d, p  d: 私钥， p：公钥
function sm2.generate_key()
    return core.wsm.sm2_generate_key()
end

--- SM2秘钥对批量生成函数
---
--- n: 秘钥对数量
function sm2.generate_keys(n)
    i = 1
    repeat
        local private, public = core.wsm.sm2_generate_key()
        print("(" .. private .. "," .. public .. ")")
        i = i + 1
    until (i > n)
end

--- SM2加密函数，模式： c1c3c2
---
--- public_key: 公钥, 长度为130的非压缩十六进制字符串
--- plain: 明文
---
--- return: 十六进制字符串
function sm2.encrypt(public_key, plain)
    return core.wsm.sm2_encrypt(public_key, plain)
end

--- SM2解密函数，模式： c1c3c2
---
--- private_key: 私钥, 长度为64的十六进制字符串
--- cipher: 密文
---
--- return: 明文
function sm2.decrypt(private_key, cipher)
    return core.wsm.sm2_decrypt(private_key, cipher)
end

--- SM2加密函数，模式： c1c2c3
---
--- public_key: 公钥, 长度为130的非压缩十六进制字符串
--- plain: 明文
---
--- return: 十六进制字符串
function sm2.encrypt_c1c2c3(public_key, plain)
    return core.wsm.sm2_encrypt_c1c2c3(public_key, plain)
end

--- SM2解密函数，模式： c1c2c3
---
--- private_key: 私钥, 长度为64的十六进制字符串
--- cipher: 密文
---
--- return: 明文
function sm2.decrypt_c1c2c3(private_key, cipher)
    return core.wsm.sm2_decrypt_c1c2c3(private_key, cipher)
end

--- SM2签名函数
---
--- private_key: 私钥, 长度为64的十六进制字符串
--- public_key: 公钥, 长度为130的非压缩十六进制字符
--- plain: 原文
---
--- return: 签名，ans1编码格式的十六进制字符
function sm2.sign(private_key, public_key, plain)
    return core.wsm.sm2_sign(private_key, public_key, plain)
end

--- SM2验签函数
---
--- public_key: 公钥, 长度为130的非压缩十六进制字符
--- plain: 原文
--- signature: 签名
---
--- return：boolean
function sm2.verify(public_key, plain, signature)
    return core.wsm.sm2_verify(public_key, plain, signature)
end

return sm2