<p>
  <a href="#Travis CI"><img src="https://www.travis-ci.com/gcdd1993/qinglong-xdd.svg?branch=master" alt="Build Status"></a>
</p>

# 青龙面板与xdd扫码登录结合

## 教程

[gcdd1993/qinglong-xdd: 青龙面板集成xdd (github.com)](https://github.com/gcdd1993/qinglong-xdd)

[Docker Hub](https://hub.docker.com/repository/docker/gcdd1993/qinglong-xdd)

## 更新日志

- v20210818

> 青龙版本`v2.8.2`

## 使用

```bash
mkdir -p /data/qinglong-xdd
cd /data/qinglong-xdd
wget https://ghproxy.com/https://raw.githubusercontent.com/gcdd1993/qinglong-xdd/main/docker/docker-compose.yml
docker-compose up -d
# 然后修改xddconf目录下的配置文件
# app.conf #启动端口
# config.yaml #xdd配置
# 修改完毕重启容器
docker-compose restart
```

##  xdd配置简介

> 摘自[群晖Docker青龙面板XDD扫码部署指南8.16更新新版编译 – 科技玩家 (kejiwanjia.com)](https://www.kejiwanjia.com/zheteng/9392.html)

```yaml
mode: balance #模式 balance(均衡模式)、parallel(平行模式)
containers: #容器，可配置多个
  - address: http://192.168.31.233:5700 #青龙2.2、青龙2.8、v1v2v3v4v5访问地址（根据自己ip填）
    username: admin #用户名（青龙config文件夹-auth.json文件找）
    password: admin #密码（青龙config文件夹-auth.json文件找）
    weigth:  #权重 balance模式下权重越高分得的ck越多，默认1（看你自己，我单容器默认）
    mode: parallel #单独对容器进行模式设置（自己选）
    limit:  #限制容器ck数目 （我没限制）
  #- address: http://192.168.31.233:5525 ##（单容器注释，多容器保留）
  #  username: admin
  #  password: admin
  #- path: /Users/cdle/Desktop/jd_study/jdc/config.sh #本地配置文件路径 v1v2v3v4v5和不知名容器的配置
  #- path: /Users/cdle/Desktop/jd_study/jdc/list.sh
theme: https://ghproxy.com/https://raw.githubusercontent.com/cdle/jd_study/main/xdd/theme/noodin.html #自定义主题，支持本地、网络路径（我喜欢吃面）
static: ./static #静态文件 便于自定义二维码页面时，引入css、js等文件（不用动）
master: jd_xxxxx #管理员账户pin，有多个用'&'拼接
database: /volume1/docker/ql/db/.jdc.db  #数据库位置，默认./.jdc.db #（强迫症的我还是给它找了个家，路径按自己的来改）
qywx_key:  #企业微信推送key（这个就是企业微信机器人的key）
daily_push: #定时任务（这个我暂时没有配置）
resident: #均衡模式下所有容器共同的账号pin，有多个用'&'拼接。不建议填写，后续实现指定账号助力功能。（这个我也没配置，多容器自己试试）
#自定义ua
user_agent:
telegram_bot_token:  #telegram bot token（这个应该不用再说了吧）
telegram_user_id:  #telegrame user id（这个应该不用再说了吧）
qquid:  #接收通知的qq号（这个填你的群主qq号码，和扫码配置的qq机器人分开，需要2个qq号）
qqgid:  #监听的群（把你的羊毛群号填上去）
default_priority: #新用户默认优先级（默认就行，默认是1）
no_ghproxy: true #更新资源是否不使用代理 默认false（看你自己的运行环境填）
qbot_public_mode: true  #qq机器人群聊模式，默认私聊模式（我用了群测试，所以改了true，默认false）
daily_asset_push_cron: 0 9 * * * #日常资产推送时间（这个应该也不用再说了吧）
```

# 更新

> 可以修改`docker-compose.yml`里面的`image.tag`为你要改的版本，所有版本在这里可以看到[Docker Hub](https://hub.docker.com/repository/docker/gcdd1993/qinglong-xdd)

```bash
# ！！注意：执行这一步前，如果有需要备份的文件没有mount到宿主机的，记得备份
docker-compose down && docker-compose up -d 
# 查看日志
docker-compose logs -f 
```

## 修改`docker-compose.yml`中的映射路径

> 建议使用我仓库默认的

```yaml
volumes:
  - ./config:/ql/config
  - ./log:/ql/log
  - ./db:/ql/db
  - ./repo:/ql/repo
  - ./raw:/ql/raw
  - ./scripts:/ql/scripts
  - ./jbot:/ql/jbot
  - ./xddconf:/ql/xdd/conf
```

# 交流或代挂

- [TG群](https://t.me/jd_wool)

- 联系微信 gclovewm123

 <img src="https://raw.githubusercontent.com/gcdd1993/gcdd1993.github.io/feature/imageRepo/img/微信二维码.jpg" width = "200" height = "200" alt="扫码加我好友，一起薅羊毛" align=center />
