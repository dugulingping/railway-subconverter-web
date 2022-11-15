# railway-subconverter-web

将后端[subconverter](https://github.com/tindy2013/subconverter)和前端[subwebM](https://github.com/dugulingping/subwebM)组合在一个docker镜像服务里

虽然项目名字叫railway-subconverter-web，但是可以部署在多平台的docker上运行。

家里的X86设备软路由和Nas都能跑，Arm设备只测试了树莓派3B V1.2版本。

## 在Docker上部署

```shell
sudo docker run -d --restart=always -p 25500:25500 dugulingping/railway-subconverter-web:latest
curl http://localhost:25500/version
# 您看到 `subconverter vx.x.x backend` 服务已经成功启动
# 在web浏览器打开http://your-ip:25500
```

## 在Railway.app上搭建

Railway是一家新开的Docker服务托管服务商，每个月有免费的5美元额度。跑一些轻容器是没问题的。

直接点击下面的按钮，等待构建完成即可使用

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/IMPRc1?referralCode=ZnTvJC)

## 配置

将配置文件等放在files/文件夹内

Railway.app可能在国内打开困难，可以自行架设cloudflare worker作为中转代理，同时限制他人对接口的滥用：

1. 复制cloudflare-worker.js中的内容到cloudflare worker编辑页面中，并且修改1-27行（有注释）

1. 修改第2行的网址为你的Railway后端地址（不带末尾的/斜杠）

1. 匹配黑名单内中的关键词或正则的订阅网址会被屏蔽，默认禁用节点池网站以及放在github上的订阅链接

1. 只有白名单中的IP会被允许使用（这功能好像没用）
w
# 在web浏览器打开http://your-ip:25500
