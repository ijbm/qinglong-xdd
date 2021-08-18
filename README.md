<p>
  <a href="#Travis CI"><img src="https://www.travis-ci.com/gcdd1993/qinglong-ninja.svg?branch=main" alt="Build Status"></a>
</p>

# 青龙面板与ninja扫码登录结合

## 教程

[【京东薅羊毛】一键部署青龙面板+ninja扫码登录 | IT学习社 (gcdd.top)](https://blog.gcdd.top/p/56460/)
[Github](https://github.com/gcdd1993/qinglong-ninja)

## 更新日志

- v20210812

> 青龙版本`v2.8.1-005`

- v20210810

> 青龙版本`v2.8.1-004`

- v20210804

> 第一个版本，青龙版本`v2.8.1-003`

## 使用

```bash
mkdir -p /data/qinglong-ninja
cd /data/qinglong-ninja
wget https://ghproxy.com/https://raw.githubusercontent.com/gcdd1993/qinglong-ninja/main/docker/docker-compose.yml
docker-compose up -d
```

# 更新

> 可以修改`docker-compose.yml`里面的`image.tag`为你要改的版本，所有版本在这里可以看到[Docker Hub](https://hub.docker.com/repository/docker/gcdd1993/qinglong-ninja)

```bash
# ！！注意：执行这一步前，如果有需要备份的文件没有mount到宿主机的，记得备份
docker-compose down && docker-compose up -d 
# 查看日志
docker-compose logs -f 
```

## 修改`docker-compose.yml`中的映射路径

```yaml
volumes:
  - ./config:/ql/config
  - ./log:/ql/log
  - ./db:/ql/db
  - ./repo:/ql/repo
  - ./raw:/ql/raw
  - ./scripts:/ql/scripts
  - ./jbot:/ql/jbot
```

# 交流或代挂

- [TG群](https://t.me/jd_wool)

- 联系微信 gclovewm123

 <img src="https://raw.githubusercontent.com/gcdd1993/gcdd1993.github.io/feature/imageRepo/img/微信二维码.jpg" width = "200" height = "200" alt="扫码加我好友，一起薅羊毛" align=center />
