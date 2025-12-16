#!/usr/bin/env bash
set -e

echo "=== Minecraft mcbot OneKey Uninstall ==="

pm2 delete mcbot >/dev/null 2>&1 || true
pm2 save

rm -rf node_modules
rm -f package-lock.json

echo "已停止并卸载 mcbot"
