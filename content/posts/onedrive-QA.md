---
title: "Onedrive同步非Onedrive中的文件或文件夹"
date: 2019-04-12T20:50:13+08:00
draft: false
tags: ["Windows", "Onedrive"]
---

### 在Onedrive中同步非Onedrive中的文件夹

命令提示符下:
``` cmd
mklink /d 需要同步的目录  目标目录(Onedrive中的文件夹名称)
```

### 解决onedrive上传文件时, 一直提示“正在处理更改”的方法
命令提示符下:
``` cmd
%localappdata%\Microsoft\OneDrive\onedrive.exe /reset
```