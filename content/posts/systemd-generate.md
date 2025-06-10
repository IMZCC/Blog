---
title: "Systemd Generate"
date: 2022-01-20T10:54:05+08:00
draft: false
tags: ["Linux", "Systemd"]
---

## 创建一个systemd service配置

### 1. 创建一个用户 [can be ignore]
```bash
adduser {username} -s /sbin/nologin 
```

### 2. 创建一个服务描述文件
```bash
vim /etc/systemd/system/{myservice}.service
```

---

文件内容：

``` plaintext
[Unit]
Description=Service Description
After=network.target 

[Service]
Type=simple
Restart=always
RestartSec=1
WorkingDirectory=/usr/local/
ExecStart=[start command]
StandardOutput=null
StandardError=null

[Install]
WantedBy=multi-user.target
```

### 3. 重载Systemd使配置生效
```bash
systemctl daemon-reload
```