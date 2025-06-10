---
title: "记Rocky Linux安装v2rayA， 启用firewalld无法上网"
date: 2021-12-15T21:27:23+08:00
draft: false
tags: ["Linux", "Rocky", "v2ray", "v2rayA", "Firewalld"]
---
> Rucky Linux 安装 [v2rayA][1]作为旁路由，开启`firewalld`后无法上网
```shell
#允许防火墙伪装IP
firewall-cmd --add-masquerade --permanent

#检查是否允许伪装IP
firewall-cmd --query-masquerade

#重载配置文件使之生效
firewall-cmd --reload
```

  [1]: https://github.com/v2rayA/v2rayA