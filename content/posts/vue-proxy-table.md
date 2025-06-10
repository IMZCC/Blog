---
title: "Vue Proxy Table"
date: 2021-02-19T21:08:01+08:00
draft: false
tags: ["Vue"]
---
Vue使用ProxyTable避免CORS跨域问题

添加proxyTable列表，将future-acount服务代理到本地调试服务上，这样就解决了跨域的问题

```vue
proxyTable: {
      '/future-account': {
        target: 'http://127.0.0.1:8204',
        changeOrigin: true,
        pathRewrite: {
        '^/future-account': ''
        }
      }
    }
```

---

由于项目设计问题，需要将client/src/services/http.js

注释2、6行，取消网关前缀，否则代理不生效

```js
//import * as config from '../config' 	//2行
//baseURL: config.gateway,				//6行
```