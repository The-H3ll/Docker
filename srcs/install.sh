# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: molabhai <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/23 18:26:50 by molabhai          #+#    #+#              #
#    Updated: 2020/03/09 16:47:35 by molabhai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

apt update
apt -y install  nginx
apt -y install vim
apt -y install wget
apt -y install  lsb-release gnupg
apt -y install expect
apt -y install php-fpm php-cli php-mysql php-gd php-imagick php-recode php-tidy php-xmlrpc
apt -y install php-json php-mbstring

wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb

dpkg -i mysql-apt-config_0.8.15-1_all.deb

expect select.exp

export DEBIAN_FRONTEND=noninteractive

apt update

apt -y install mysql-server

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz

wget https://wordpress.org/latest.tar.gz
