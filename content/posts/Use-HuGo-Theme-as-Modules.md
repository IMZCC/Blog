---
title: "HuGo使用Git子模块主题，部署后无主页"
date: 2022-01-18T20:32:19+08:00
draft: false
tags: ["HuGo", "Vercel", "Git"]
---

## 使用LoveIt主题

Vercel部署只有index.xml，没有正文内容，Vercel部署Log显示。


```text
Building sites … WARN 2022/01/18 06:02:53 found no layout file for "HTML" for kind "page": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.
```

需要在Vercel项目Setting中，Building Script加入
```bash
git submodule update --init && hugo -D --gc
```