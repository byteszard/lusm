---
--- SM4
---
--- 支持ECB、CBC、CFB、OFB、CTR分组模式
---
--- Author: 尼维沙·纳默帝敖
---

sm4 = {}

local lib = require("lib")

---
--- 秘钥生成
---
--- return: 长度32的十六进制字符串
function sm4.generate_key()
    return lib.wsm.sm4_generate_key()
end

---
--- 初始化向量生成，用于CBC、CFB、OFB、CTR分组模式
---
--- return: 长度32的十六进制字符串
function sm4.generate_iv()
    return lib.wsm.sm4_generate_iv()
end

--- ECB分组模式-加密
---
--- key：秘钥
--- plain: 明文
---
--- return：密文，十六进制字符串
function sm4.encrypt_ecb(key, plain)
    return lib.wsm.sm4_encrypt_ecb(key, plain)
end

--- ECB分组模式-解密
---
--- key：秘钥
--- cipher: 密文
---
--- return：明文，十六进制字符串
function sm4.decrypt_ecb(key, cipher)
    return lib.wsm.sm4_decrypt_ecb(key, cipher)
end

--- CBC分组模式-加密
---
--- key：秘钥
--- iv: 初始化向量
--- plain: 明文
---
--- return：密文，十六进制字符串
function sm4.encrypt_cbc(key, iv, plain)
    return lib.wsm.sm4_encrypt_cbc(key, iv, plain)
end

--- CBC分组模式-解密
---
--- key：秘钥
--- iv: 初始化向量
--- cipher: 密文
---
--- return：明文，十六进制字符串
function sm4.decrypt_cbc(key, iv, cipher)
    return lib.wsm.sm4_decrypt_cbc(key, iv, cipher)
end

--- CFB分组模式-加密
---
--- key：秘钥
--- iv: 初始化向量
--- plain: 明文
---
--- return：密文，十六进制字符串
function sm4.encrypt_cfb(key, iv, plain)
    return lib.wsm.sm4_encrypt_cfb(key, iv, plain)
end

--- CFB分组模式-解密
---
--- key：秘钥
--- iv: 初始化向量
--- cipher: 密文
---
--- return：明文，十六进制字符串
function sm4.decrypt_cfb(key, iv, cipher)
    return lib.wsm.sm4_decrypt_cfb(key, iv, cipher)
end

--- OFB分组模式-加密
---
--- key：秘钥
--- iv: 初始化向量
--- plain: 明文
---
--- return：密文，十六进制字符串
function sm4.encrypt_ofb(key, iv, plain)
    return lib.wsm.sm4_encrypt_ofb(key, iv, plain)
end

--- OFB分组模式-解密
---
--- key：秘钥
--- iv: 初始化向量
--- cipher: 密文
---
--- return：明文，十六进制字符串
function sm4.decrypt_ofb(key, iv, cipher)
    return lib.wsm.sm4_decrypt_ofb(key, iv, cipher)
end

--- CTR分组模式-加密
---
--- key：秘钥
--- iv: 初始化向量
--- plain: 明文
---
--- return：密文，十六进制字符串
function sm4.encrypt_ctr(key, iv, plain)
    return lib.wsm.sm4_encrypt_ctr(key, iv, plain)
end

--- CTR分组模式-解密
---
--- key：秘钥
--- iv: 初始化向量
--- cipher: 密文
---
--- return：明文，十六进制字符串
function sm4.decrypt_ctr(key, iv, cipher)
    return lib.wsm.sm4_decrypt_ctr(key, iv, cipher)
end


return sm4