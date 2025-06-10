---
title: "Linux Tar Command"
date: 2021-11-11T21:24:07+08:00
draft: false
tags: ["Linux", "Tar", "Command"]
---

## 给当前文件夹下所有文件添加`.bak`后缀
```shell
ll | awk '{print $9}' | grep -v '^[ ]*$' |sed -r 's#(.*)#mv \1 \1.bak#g'|bash
```

## 把当前文件夹下所有`.bak`后缀的文件，将`.bak`后缀删掉，并替换
```shell
ll | awk '{print $9}' | grep -v '^[ ]*$' |sed -r 's#((.*)\.bak)#mv \1 \2#g' | bash
```