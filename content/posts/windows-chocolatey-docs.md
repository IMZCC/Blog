---
title: "Chocolatey - Windows下包管理器"
date: 2019-12-27T21:03:39+08:00
draft: false
tags: ["Windows", "Chocolatey"]
---

cmd设置代理
```cmd
set http_proxy=http://127.0.0.1:1081
set https_proxy=http://127.0.0.1:1081
```

## 安装：
1.使用管理员身份运行PowerShell
``` PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
  2.或者使用CMD运行
``` cmd
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```


## 使用

``` cmd
#### 搜索软件
choco search curl -all
choco search node

####  安装软件
choco install jdk8

#### 查看软件
choco list --local  //查看已安装软件
choco list -li
choco list -lai
choco list --page=0 --page-size=25
choco search git

#### 升级软件
choco upgrade curl

#### 卸载软件
choco uninstall curl
```

注意：可以在 [Chocolatey Packages](https://chocolatey.org/packages") 查找你需要的软件包，或者使用`choco list 软件名` 查询是否这个软件

