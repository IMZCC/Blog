---
title: "Linux常用运维命令"
date: 2021-07-16T21:12:30+08:00
draft: true
tags: ["Linux", "Command"]
---
# 分别打包每个目录
排除日志、缓存、Jar解压的文件、脚本、data、json文件。
```shell
ls -d 目录名.. | xargs -I {} tar -zcvf {}.tar.gz {} --exclude=logs --exclude=*log* --exclude=*.hprof --exclude=*.bak --exclude=*.json --exclude=*.json --exclude-caches-all --exclude-caches --exclude-backups --exclude-vcs --exclude=BOOT-INF --exclude=META-INF --exclude=org --exclude=*.data --exclude=*.sh --exclude=*.jar.* 
```

# 打包某个目录并压缩
```shell
tar -zcvf 生成的压缩文件.tar.gz 被打包的目录 --exclude=logs --exclude=*.log --exclude=*.hprof --exclude=*.bak --exclude=*.json --exclude=*.json --exclude-caches-all --exclude-caches --exclude-backups --exclude-vcs --exclude=BOOT-INF --exclude=META-INF --exclude=org --exclude=*.data --exclude=*.sh --exclude=edit_all_properties
```

# 删除n天前的日志
```shell
find 对应目录 -mtime +天数 -name "文件名" -exec rm -rf {} \;

find ./ -name 文件名 -exec cp /dev/null {} \;
```
# 查看进程被杀死的历史
```shell
dmesg -T | grep "(java)"
```


# 分组统计连接数
```shell
netstat -anp | grep 3306 | grep EST | awk '{count[$7]++;} END {for(i in count) {print i "  " count[i]}}'
```
# 进程相关
```
ps -o pgid {pid} //查找进程所属进程组
 
kill -9 -{pgid} //杀死进程组
```

#Java服务堆内存快照
```
jmap -dump:live,format=b,file=heapdump.hprof PID
```