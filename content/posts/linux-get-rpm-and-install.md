---
title: "Get Rpm and Install"
date: 2021-11-04T21:20:27+08:00
draft: false
tags: ["Linux", "RPM", "YUM"]
---
## 如何依赖下载rpm包，已VIM 为例。

1. 安装yumdownloader

    ```bash
    yum install yum-utils
    ```

2. 下载vim的rpm依赖包

    ``` shell
    yumdownloader --resolve --destdir=./ packageName
    ```

3. 将rpm传到其他机器上，依赖安装rpm包

   ```shell
   yum localinstall *.rpm -y
   #或者
   rpm -ivh *.rpm
   ```

4. 提示缺少`vim-filesystem`与`libgpm.so.2`，继续下载此依赖

    ```shell
    yumdownloader --resolve --destdir=./ vim-filesystem
    yumdownloader --resolve --destdir=./ libgpm.so.2
    ```

5. 再次安装相关依赖

   ```shell
   yum localinstall *.rpm -y
   #或者
   rpm -ivh *.rpm --force --nodeps
   ```

   

