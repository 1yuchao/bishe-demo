#开发模式下的 Dockerfile

FROM php:8.3-rc-fpm-alpine3.20

# 安装依赖
RUN apk update && apk add --no-cache \
    git \
    curl \
    oniguruma-dev \
    libpng-dev \
    libxml2-dev \
    zip \
    unzip

# 安装 PHP 扩展
RUN docker-php-ext-install \
    pdo_mysql \
    mbstring \
    exif \
    pcntl \
    bcmath \
    gd

# 安装 Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 设置工作目录
WORKDIR /var/www/app

# 复制整个项目
COPY . .

# 设置权限
RUN chown -R www-data:www-data .

# 暴露端口
EXPOSE 8000
