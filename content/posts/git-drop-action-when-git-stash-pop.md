---
title: "git stash pop 后有冲突时，如何撤销"
date: 2021-11-05T21:22:20+08:00
draft: false
tags: ["Git"]
---

> 即可撤销 `git stash pop` 操作，将当前分支状态恢复。
> 
> `git stash` 暂存区的记录也不会被删除，可通过 `git stash show` 查看。
```bash
git reset --hard
```