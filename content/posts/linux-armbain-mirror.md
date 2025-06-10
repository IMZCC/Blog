---
title: "Armbain Mirror"
date: 2021-11-01T21:17:25+08:00
draft: false
tags: ["Linux"]
---
## 编辑文件
```shell
vim /etc/apt/sources.list
```
## 添加镜像源

``` text
deb http://mirrors.ustc.edu.cn/debian stretch main contrib non-free
deb http://mirrors.ustc.edu.cn/debian stretch-updates main contrib non-free
deb http://mirrors.ustc.edu.cn/debian stretch-backports main contrib non-free
deb http://mirrors.ustc.edu.cn/debian-security/ stretch/updates main contrib non-free
```
## 更新apt
```shell
apt-get update
```