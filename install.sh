#!/usr/bin/env bash
set -e

echo "=== Minecraft mcbot OneKey Installer ==="
echo

# 必须 root
if [ "$EUID" -ne 0 ]; then
  echo "请使用 root 用户运行"
  exit 1
fi

# ========= 你需要改的地方 =========
REPO_URL="https://github.com/liwenxiang1984/mcbot-onekey"
APP_DIR="mcbot-onekey"
# ==================================

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

# ---------- 拉取项目 ----------
if [ ! -d "$APP_DIR" ]; then
  echo "[*] Cloning repository..."
  git clone "$REPO_URL"
else
  echo "[*] Repository already exists, pulling latest..."
  cd "$APP_DIR"
  git pull
  cd ..
fi

cd "$APP_DIR"

# ---------- 校验入口文件 ----------
if [ ! -f index.js ]; then
  echo "[ERROR] index.js 不存在，请检查仓库内容"
  exit 1
fi

# ---------- 安装依赖 ----------
npm install

# ---------- 启动 ----------
pm2 delete mcbot >/dev/null 2>&1 || true
pm2 start index.js --name mcbot
pm2 save

echo
echo "=== 安装完成 ==="
echo "项目目录：$(pwd)"
echo "查看状态：pm2 ls"
echo "查看日志：pm2 logs mcbot"
