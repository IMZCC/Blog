---
title: "Centos7恢复默认Python环境"
date: 2021-02-23T21:08:44+08:00
draft: false
tags: ["Linux", "Centos", "Python"]
categories: ["Linux", "随笔"]
---

## 背景

把公司一台测试环境的 Cetnos7 Python 升级到了 3.6.8，安装了一些自定义模块后不小心把整个 pip 库删掉了，导致 yum 也运行不了了。

### 1.准备软件包

首先创建一个目录存放软件包

```shell
mkdir python && cd python
```

### 2.下载依赖软件包

```shell
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/lvm2-python-libs-2.02.177-4.el7.x86_64.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/libxml2-python-2.9.1-6.el7_2.3.x86_64.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/python-libs-2.7.5-68.el7.x86_64.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/python-ipaddress-1.0.16-2.el7.noarch.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/python-backports-1.0-8.el7.x86_64.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/python-2.7.5-68.el7.x86_64.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/python-iniparse-0.4-9.el7.noarch.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/python-pycurl-7.19.0-19.el7.x86_64.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/python-urlgrabber-3.10-8.el7.noarch.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/python-setuptools-0.9.8-7.el7.noarch.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/python-kitchen-1.1.1-5.el7.noarch.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/python-chardet-2.2.1-1.el7_1.noarch.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/rpm-python-4.11.3-32.el7.x86_64.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/yum-utils-1.1.31-45.el7.noarch.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/yum-3.4.3-158.el7.centos.noarch.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/yum-metadata-parser-1.1.4-10.el7.x86_64.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/yum-plugin-aliases-1.1.31-45.el7.noarch.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/yum-plugin-protectbase-1.1.31-45.el7.noarch.rpm
wget http://vault.centos.org/centos/7.5.1804/os/x86_64/Packages/yum-plugin-fastestmirror-1.1.31-45.el7.noarch.rpm
```

### 3.安装软件包

```shell
rpm -Uvh --replacepkgs lvm2-python-libs*.rpm --nodeps --force
rpm -Uvh --replacepkgs libxml2-python*.rpm --nodeps --force
rpm -Uvh --replacepkgs python*.rpm --nodeps --force
rpm -Uvh --replacepkgs rpm-python*.rpm yum*.rpm --nodeps --force
```

## 效果

此时 yum 与 python 环境都已经恢复了。

python:

```shell
python --version
```

yum:

```shell
yum --version
```
