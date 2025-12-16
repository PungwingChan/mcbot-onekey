/**
 * Minecraft Bot Keep Alive
 * Single-entry version (no servers.json)
 */

const servers = [
  {
    host: '191.96.231.11',
    port: 32968,
    // username: 'AFK_Bot',   // 可选，不写则随机
    // version: '1.21.1'     // 可选，不写则自动检测
  }

  // 如果需要多个服务器，继续往下加
  // ,
  // {
  //   host: 'example.mcserver.com',
  //   port: 25565
  // }
]

if (!Array.isArray(servers) || servers.length === 0) {
  console.error('[ERROR] 未配置任何服务器')
  process.exit(1)
}

console.log(`[*] 启动 ${servers.length} 个 Minecraft Bot`)

for (const s of servers) {
  if (!s.host || !s.port) {
    console.warn('[WARN] 跳过无效配置:', s)
    continue
  }

  process.env.HOST = s.host
  process.env.PORT = s.port
  if (s.username) process.env.USERNAME = s.username
  if (s.version) process.env.VERSION = s.version

  require('@baipiaodajun/mcbot')
}
