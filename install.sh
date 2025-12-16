#!/usr/bin/env bash
set -e

echo "=== Minecraft mcbot OneKey Installer ==="

# 必须 root
if [ "$EUID" -ne 0 ]; then
  echo "请使用 root 用户运行"
  exit 1
fi

# ---------- 基础依赖 ----------
apt update
apt install -y curl git

# ---------- 检查 Node.js ----------
NEED_NODE=0

if command -v node >/dev/null 2>&1 && command -v npm >/dev/null 2>&1; then
  NODE_VERSION=$(node -v | sed 's/v//')
  NODE_MAJOR=${NODE_VERSION%%.*}

  echo "[*] Detected Node.js v${NODE_VERSION}"

  if [ "$NODE_MAJOR" -lt 18 ]; then
    echo "[!] Node.js 版本过低（<18），将安装 Node.js 22"
    NEED_NODE=1
  else
    echo "[✓] Node.js 版本可用，跳过安装"
  fi
else
  echo "[!] Node.js / npm 未检测到，将安装 Node.js 22"
  NEED_NODE=1
fi

# ---------- 安装 Node.js 22（仅在需要时） ----------
if [ "$NEED_NODE" -eq 1 ]; then
  curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
  apt install -y nodejs
fi

# ---------- 检查 pm2 ----------
if command -v pm2 >/dev/null 2>&1; then
  echo "[✓] pm2 已存在，跳过安装"
else
  echo "[*] Installing pm2..."
  npm install -g pm2
fi

# ---------- 安装项目依赖 ----------
npm install @baipiaodajun/mcbot mineflayer minecraft-protocol node-fetch

# ---------- 初始化 servers.json ----------
if [ ! -f servers.json ]; then
cat > servers.json <<EOF
[
  {
    "host": "emerald.magmanode.com",
    "port": 25565
  }
]
EOF
fi

# ---------- 启动 mcbot ----------
pm2 delete mcbot >/dev/null 2>&1 || true
pm2 start index.js --name mcbot
pm2 save

echo
echo "=== 安装完成 ==="
echo "编辑 servers.json 添加服务器"
echo "查看状态：pm2 ls"
echo "查看日志：pm2 logs mcbot"
