# hexo-docker

hexo的docker镜像

在不安装nodejs环境下，构建hexo的博客系统


# 使用方法

## 构建镜像

克隆下这个仓库，进入目录

```
docker build . -t ff/hexo
```

## 初始化目录

```
docker run -it --rm -v /home/ff/hexo:/workdir ff/hexo hexo init blog
```
* `-t` 开一个终端
* `-i` 标准输入打开
* `--rm` 运行完就删除
* `-v` 映射目录


## 安装依赖

```
docker run -it --rm -v /home/ff/hexo:/workdir ff/hexo sh -c "cd blog; npm install"
```

## 新建博文

```
docker run -it --rm -v /home/ff/hexo:/workdir ff/hexo sh -c "cd blog; hexo new test"
```

## 预览

```
docker run -it --rm -p 80:4000 -v /home/ff/hexo:/workdir ff/hexo sh -c "cd blog; hexo serve"
```

## 生成html

```
docker run -it --rm -v /home/ff/hexo:/workdir ff/hexo sh -c "cd blog; hexo g"
```

## 切换主题

这里在本地文件目录中修改就可以了
```
cd /home/ff/hexo/blog
# 下载next 主题
git clone https://github.com/iissnan/hexo-theme-next themes/next
# 替换主题
sed '/theme: landscape/ ctheme: next' -i _config.yml
```

再运行预览命令
```
docker run -it --rm -p 80:4000 -v /home/ff/hexo:/workdir ff/hexo sh -c "cd blog; hexo serve"
```

