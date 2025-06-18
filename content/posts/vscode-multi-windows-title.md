---
title: "VSCode多窗口标题默认显示当前文件名，而不是工作区名"
date: 2025-06-18T10:07:34+08:00
draft: false
tags: ["VSCode"]
categories: ["VSCode"]
---

> File -> Preferences -> setting 搜 "Window: Title" 改成：

```txt
${dirty}${rootName}${separator}${activeEditorMedium}${separator}${appName}
```