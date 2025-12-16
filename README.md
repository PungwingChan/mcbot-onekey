# Minecraft Bot Keep Alive（mcbot-onekey）

基于 @baipiaodajun/mcbot + pm2 的 Minecraft 保活 Bot  
支持 **多个服务器同时挂机**

## 支持环境
- Debian / Ubuntu
- Node.js 22
- Java 服务器（推荐 Paper 1.21.1）

## 一键安装
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/你的用户名/mcbot-onekey/main/install.sh)

```配置服务器
编辑 servers.json：
[
  {
    "host": "emerald.magmanode.com",
    "port": 34356
  }
]
支持多个服务器，直接添加即可。

查看状态
pm2 ls
pm2 logs mcbot

卸载
bash <(curl -fsSL https://raw.githubusercontent.com/你的用户名/mcbot-onekey/main/uninstall.sh)

注意事项
不支持 Minecraft 1.21.4+（协议 773）
推荐使用 Paper 1.21.1
适用于挂机 / 保活 / 测试用途
