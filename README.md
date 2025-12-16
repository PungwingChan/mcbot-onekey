# 🤖 Minecraft Bot Keep Alive (mcbot-onekey)

> 基于 @baipiaodajun/mcbot + pm2 的 Minecraft 保活 Bot  
> 让你的服务器永不掉线 🚀

## ✨ 特性

- 🌐 **多服务器支持** - 同时挂机多个 Minecraft 服务器
- 🎲 **自动随机用户名** - 无需手动配置，自动生成
- 🔍 **智能版本检测** - 自动识别服务器版本
- 💪 **稳定可靠** - 基于 pm2 进程管理，自动重启
- ⚡ **一键部署** - 一条命令搞定所有配置

## 📋 适用场景

- 🏠 服务器保活 / 挂机
- 🧪 服务器测试
- 👥 模拟玩家在线

---

## 🚀 快速开始

### 第零步：配置你的 Minecraft 服务器

在开始之前，请先确保你的 Paper 服务器配置正确。

重要⚠️：Java Version 1.21.1
重要⚠️：Java Version 1.21.1
重要⚠️：Java Version 1.21.1

编辑服务器目录下的 `server.properties` 文件，确保以下配置项设置正确：

```properties
# 取消在线验证，这样非正式客户端能连接
online-mode=false

# 和平模式，防止机器人被僵尸击杀频繁重连影响保活
difficulty=peaceful

# 关闭白名单模式，任何玩家都可加入服务器
white-list=false
```

> ⚠️ **重要提示**：修改配置后需要重启服务器才能生效！

配置完成后，就可以继续下面的步骤了 👇

---

### 第一步：Fork 本仓库

1. 打开 [本仓库页面](https://github.com/你的用户名/mcbot-onekey)
2. 点击右上角 **Fork** 按钮
3. Fork 到你自己的 GitHub 账号下

> 💡 Fork 后，后续所有命令都会使用 **你自己的仓库地址**

### 第二步：一键安装

复制下面这一整行命令，在服务器终端中执行：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/你的用户名/mcbot-onekey/main/install.sh)
```

#### 🎯 安装脚本会自动完成：

- ✅ 检测并安装 Node.js 22（如未安装）
- ✅ 安装 npm
- ✅ 全局安装 pm2
- ✅ 安装 @baipiaodajun/mcbot 依赖
- ✅ 初始化配置文件
- ✅ 启动 Bot 服务

**无需任何人工干预，坐等安装完成即可！** ☕

---

## ⚙️ 配置服务器

安装完成后，编辑 `servers.json` 文件：

### 单服务器配置示例

```json
[
  {
    "host": "emerald.magmanode.com",
    "port": 34356
  }
]
```

### 多服务器配置示例

```json
[
  {
    "host": "emerald.magmanode.com",
    "port": 34356
  },
  {
    "host": "example.mcserver.com",
    "port": 25565
  },
  {
    "host": "another-server.net",
    "port": 25566,
    "username": "CustomBot",
    "version": "1.20.1"
  }
]
```

### 📝 配置说明

| 参数 | 说明 | 是否必填 |
|------|------|----------|
| `host` | Minecraft 服务器地址 | ✅ 必填 |
| `port` | Minecraft 服务器端口 | ✅ 必填 |
| `username` | 登录用户名 | ❌ 可选（不填自动随机生成）|
| `version` | Minecraft 版本 | ❌ 可选（不填自动检测）|

保存后，Bot 会自动为每个服务器启动一个独立进程 🎉

---

## 📊 管理命令

### 查看所有 Bot 进程状态

```bash
pm2 ls
```

### 查看 Bot 实时日志

```bash
pm2 logs mcbot
```

### 重启所有 Bot

```bash
pm2 restart all
```

### 停止所有 Bot

```bash
pm2 stop all
```

---

## 🗑️ 停止 / 卸载

需要完全卸载？复制下面这一整行命令执行：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/你的用户名/mcbot-onekey/main/uninstall.sh)
```

### 🧹 卸载脚本会自动完成：

- ✅ 停止所有 mcbot 进程
- ✅ 删除 pm2 进程配置
- ✅ 删除 node_modules
- ✅ 删除配置文件
- ✅ 不影响系统中其他服务

---

## ⚠️ 重要注意事项

### 版本兼容性

- ❌ **不支持** Minecraft 1.21.4 及以上版本（协议 773+）
- ✅ **推荐使用** Paper 1.21.1（最稳定）
- 💡 如果服务器版本过新，请先降版本再使用

### 服务器配置建议

在 `server.properties` 中添加以下配置：

```properties
# 取消在线验证，允许非正式客户端连接
online-mode=false

# 和平模式，防止机器人被怪物击杀
difficulty=peaceful

# 关闭白名单，允许任何玩家加入
white-list=false
```

### 使用声明

- 📌 本工具仅用于 **挂机 / 保活 / 测试** 用途
- 🚫 不适合商业用途
- ⚖️ 请遵守服务器规则，合理使用

---

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License

---

## 💖 致谢

- [@baipiaodajun/mcbot](https://github.com/baipiaodajun/mcbot) - 核心 Bot 库
- [pm2](https://pm2.keymetrics.io/) - 进程管理工具

---

<div align="center">

**⭐ 如果这个项目对你有帮助，请给个 Star 支持一下！**

Made with ❤️ by Minecraft 玩家们

</div>
