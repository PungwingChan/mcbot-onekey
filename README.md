# Minecraft Bot Keep Alive（mcbot-onekey）

基于 @baipiaodajun/mcbot + pm2 的 Minecraft 保活 Bot  
支持 **多个服务器同时挂机**

---

## 一键安装（复制这一整行即可）

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/你的用户名/mcbot-onekey/main/install.sh)
```

---

## 配置服务器

安装完成后，编辑 servers.json：

```json
[
  {
    "host": "emerald.magmanode.com",
    "port": 34356
  }
]
```

支持多个服务器，直接继续添加即可。

---

## 查看运行状态

```bash
pm2 ls
pm2 logs mcbot
```

---

## 停止 / 卸载

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/你的用户名/mcbot-onekey/main/uninstall.sh)
```

---

## 注意事项

- 不支持 Minecraft 1.21.4+（协议 773）
- 推荐使用 Paper 1.21.1
- 适用于挂机 / 保活 / 测试用途
