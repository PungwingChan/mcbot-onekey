# 🤖 Minecraft Bot Keep Alive (mcbot-onekey)

> 基于 @baipiaodajun/mcbot + pm2 的 Minecraft 保活 Bot  
> 让你的服务器永不掉线 🚀

## ✨ 特性

- 🌐 **多服务器支持** - 同时挂机多个 Minecraft 服务器
- 🎲 **自动随机用户名** - 无需手动配置，自动生成
- 🔍 **智能版本检测** - 自动识别服务器版本
- 💪 **稳定可靠** - 基于 pm2 进程管理，自动重启
- ⚡ **一键部署** - Fork 改配置，一条命令完成部署

## 📋 适用场景

- 🏠 服务器保活 / 挂机
- 🧪 服务器测试
- 👥 模拟玩家在线

---

## 🚀 快速开始

### 第零步：配置你的 Minecraft 服务器

在开始之前，请先确保你的 Paper 服务器配置正确。

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

### 第一步：Fork 并配置仓库

#### 1. Fork 本仓库

1. 打开 [本仓库页面](https://github.com/原作者/mcbot-onekey)
2. 点击右上角 **Fork** 按钮
3. Fork 到你自己的 GitHub 账号下

#### 2. 修改 `index.js` 配置服务器

在你 Fork 的仓库中，编辑 `index.js` 文件，找到服务器配置部分：

```javascript
// ========= 在这里配置你的服务器 =========
const servers = [
  {
    host: 'emerald.magmanode.com',
    port: 34356
  }
  // 添加更多服务器，直接在下面继续写
];
// =========================================
```

**单服务器示例：**

```javascript
const servers = [
  {
    host: 'your-server.com',
    port: 25565
  }
];
```

**多服务器示例：**

```javascript
const servers = [
  {
    host: 'server1.com',
    port: 25565
  },
  {
    host: 'server2.net',
    port: 25566,
    username: 'CustomBot',
    version: '1.20.1'
  },
  {
    host: 'server3.io',
    port: 34356
  }
];
```

#### 📝 配置说明

| 参数 | 说明 | 是否必填 |
|------|------|----------|
| `host` | Minecraft 服务器地址 | ✅ 必填 |
| `port` | Minecraft 服务器端口 | ✅ 必填 |
| `username` | 登录用户名 | ❌ 可选（不填自动随机生成）|
| `version` | Minecraft 版本 | ❌ 可选（不填自动检测）|

#### 3. 修改 `install.sh` 中的仓库地址

编辑 `install.sh` 文件，修改仓库地址为你自己的：

```bash
# ========= 你需要改的地方 =========
REPO_URL="https://github.com/你的用户名/mcbot-onekey.git"
APP_DIR="mcbot-onekey"
# ==================================
```

**将 `你的用户名` 替换为你的实际 GitHub 用户名。**

#### 4. 提交修改

修改完成后，记得 **Commit（提交）** 你的更改！

---

### 第二步：一键安装

> ⚠️ **注意**：此脚本需要 **root 权限**运行

复制下面这一整行命令，在你的任意VPS中执行：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/你的用户名/mcbot-onekey/main/install.sh)
```

**记得把 `你的用户名` 替换成你实际的 GitHub 用户名！**

#### 🎯 安装脚本会自动完成：

- ✅ 检查并要求 root 权限
- ✅ 更新系统包管理器
- ✅ 安装 curl 和 git
- ✅ 检测 Node.js 版本（<18 会自动安装 Node.js 22）
- ✅ 检测并安装 pm2（如未安装）
- ✅ 克隆你的仓库（包含你配置好的 `index.js`）
- ✅ 安装项目依赖
- ✅ 启动 Bot 服务

**无需任何人工干预，坐等安装完成即可！** ☕

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

### 重启 Bot

```bash
pm2 restart mcbot
```

### 停止 Bot

```bash
pm2 stop mcbot
```

### 查看详细信息

```bash
pm2 show mcbot
```

---

## 🔄 修改服务器配置

如果需要修改服务器配置（添加/删除服务器），有两种方式：

### 方式一：修改 GitHub 仓库后重新部署（推荐）

1. 在 GitHub 上修改你仓库中的 `index.js` 文件
2. 提交修改
3. 在服务器上执行：

```bash
cd mcbot-onekey
git pull
pm2 restart mcbot
```

### 方式二：直接在服务器上修改

```bash
cd mcbot-onekey
nano index.js
# 修改服务器配置
pm2 restart mcbot
```

> 💡 **注意**：方式二的修改在下次 `git pull` 时可能会被覆盖，推荐使用方式一。

---

## 🗑️ 完全卸载

### 自动卸载（如果有 uninstall.sh）

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/你的用户名/mcbot-onekey/main/uninstall.sh)
```

### 手动卸载

```bash
# 停止并删除 pm2 进程
pm2 delete mcbot
pm2 save

# 删除项目目录
cd ~
rm -rf mcbot-onekey
```

---

## ⚠️ 重要注意事项

### 权限要求

- 🔐 安装脚本需要 **root 权限**运行
- 💡 如果提示权限不足，请使用 `sudo su` 切换到 root 用户

### 版本兼容性

- ❌ **不支持** Minecraft 1.21.4 及以上版本（协议 773+）
- ✅ **推荐使用** Paper 1.21.1（最稳定）
- 💡 如果服务器版本过新，请先降版本再使用

### Node.js 版本

- 📦 脚本会自动检测 Node.js 版本
- 🔄 如果版本低于 18，会自动安装 Node.js 22
- ✅ 如果已安装 18+ 版本，会跳过安装

### 配置方式说明

- 📝 **所有服务器配置都在 `index.js` 中完成**
- 🚫 **不需要** `servers.json` 文件
- ✅ Fork 仓库 → 修改 `index.js` → 运行安装脚本 → 完成

### 项目结构

安装后的项目目录结构：

```
mcbot-onekey/
├── index.js          # 主程序入口（包含服务器配置）
├── install.sh        # 安装脚本
├── package.json      # npm 依赖配置
└── node_modules/     # 依赖包目录
```

### 使用声明

- 📌 本工具仅用于 **挂机 / 保活 / 测试** 用途
- 🚫 不适合商业用途
- ⚖️ 请遵守服务器规则，合理使用

---

## 🐛 常见问题

### 1. 提示 "请使用 root 用户运行"

**解决方案**：

```bash
sudo su
# 然后重新运行安装命令
```

### 2. Bot 连接失败

**检查清单**：
- ✅ `index.js` 中服务器地址和端口是否正确
- ✅ `server.properties` 中 `online-mode=false` 是否已设置
- ✅ 服务器版本是否支持（<1.21.4）
- ✅ 防火墙是否开放端口

### 3. 修改配置后没生效

**解决方案**：

修改 `index.js` 后需要重启 Bot：

```bash
pm2 restart mcbot
```

### 4. Node.js 版本过低

脚本会自动安装 Node.js 22，如果仍有问题，可手动安装：

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
apt install -y nodejs
```

### 5. pm2 命令找不到

```bash
npm install -g pm2
```

### 6. git pull 提示有冲突

如果你在服务器上直接修改了 `index.js`，拉取更新时可能会有冲突：

```bash
cd mcbot-onekey
git stash           # 暂存本地修改
git pull            # 拉取远程更新
git stash pop       # 恢复本地修改
# 手动解决冲突后
pm2 restart mcbot
```

---

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

如果你有好的想法或发现了 bug，请随时提交。

---

## 📄 许可证

MIT License

---

## 💖 致谢

- [@baipiaodajun/mcbot](https://github.com/baipiaodajun/mcbot) - 核心 Bot 库
- [pm2](https://pm2.keymetrics.io/) - 进程管理工具
- [Node.js](https://nodejs.org/) - JavaScript 运行环境

---

<div align="center">

**⭐ 如果这个项目对你有帮助，请给个 Star 支持一下！**

Made with ❤️ by Minecraft 玩家们

</div>
