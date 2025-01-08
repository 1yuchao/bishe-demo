FROM php:8.3-rc-fpm-alpine3.20

# 安装必要的系统依赖
RUN apk update && apk add --no-cache \
    git \
    curl \
    libpng-dev \
    oniguruma-dev \
    libxml2-dev \
    zip \
    unzip

# 安装 PHP 扩展
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# 安装 Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 设置工作目录
WORKDIR /var/www/html

# 复制应用程序文件
COPY . .

# 运行 Composer 安装依赖
RUN composer install --no-dev --optimize-autoloader

# 暴露端口
EXPOSE 8000