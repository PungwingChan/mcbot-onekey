Minecraft Bot Keep Alive（mcbot-onekey）

基于 @baipiaodajun/mcbot + pm2 的 Minecraft 保活 Bot
支持多个服务器同时挂机
支持自动随机用户名
支持自动检测服务器版本
适用于挂机 / 保活 / 测试用途

==================================================

一、Fork 本仓库（给别人用）

打开本仓库页面

点击右上角 Fork

Fork 到自己 GitHub 账号下

Fork 后，后续所有命令都会使用“你自己的仓库地址”

==================================================

二、一键安装（复制这一整行即可执行）

bash <(curl -fsSL https://raw.githubusercontent.com/你的用户名/mcbot-onekey/main/install.sh
)

说明：
安装过程会自动完成以下所有事情，无需人工干预：

自动检测并安装 Node.js 22（如未安装）

自动安装 npm

自动全局安装 pm2

自动安装 @baipiaodajun/mcbot 依赖

自动初始化配置文件

自动启动 Bot 服务

==================================================

三、配置服务器（支持多个）

安装完成后，编辑 servers.json 文件：

[
{
"host": "emerald.magmanode.com",
"port": 34356
}
]

说明：

host：Minecraft 服务器地址

port：Minecraft 服务器端口

username：不填写会自动随机生成

version：不填写会自动检测服务器版本

如果要添加多个服务器，直接继续往下加，例如：

[
{
"host": "emerald.magmanode.com",
"port": 34356
},
{
"host": "example.mcserver.com",
"port": 25565
}
]

保存后，Bot 会自动为每个服务器启动一个进程。

==================================================

四、查看运行状态

查看所有 Bot 进程状态：

pm2 ls

查看 Bot 实时日志：

pm2 logs mcbot

==================================================

五、停止 / 卸载（复制这一整行即可）

bash <(curl -fsSL https://raw.githubusercontent.com/你的用户名/mcbot-onekey/main/uninstall.sh
)

卸载将会自动完成：

停止所有 mcbot 进程

删除 pm2 进程配置

删除 node_modules

删除配置文件

不影响系统中其他服务

==================================================

六、重要注意事项（必看）

不支持 Minecraft 1.21.4 及以上版本（协议 773）

推荐使用 Paper 1.21.1（最稳定）

如果服务器版本过新，请先降服再使用

本工具不适合商业用途，仅用于挂机 / 保活 / 测试
