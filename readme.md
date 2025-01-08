# 毕业设计---
 - 作者：余超
 - 开始日期：
 - 项目技术：php@8.2
## 项目介绍

首先确保有php开发环境
- php8.0+
- composer

- 可使用dockerfile直接构建环境
- 将本地项目目录挂载到容器中运行开发。

## 安装项目依赖
```shell
composer install
```

## 启动服务

~~~
cd tp
php think run
~~~

然后就可以在浏览器中访问

~~~
http://localhost:8000
~~~

如果需要更新框架使用
~~~
composer update topthink/framework
~~~

## 命名规范

`ThinkPHP`遵循PSR-2命名规范和PSR-4自动加载规范。