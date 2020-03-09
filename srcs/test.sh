# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: molabhai <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/05 21:39:32 by molabhai          #+#    #+#              #
#    Updated: 2020/03/09 19:33:10 by molabhai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

chown -R mysql:mysql /var/lib/mysql /var/log/mysql

service mysql start

cp default /etc/nginx/sites-available/default

service php7.3-fpm start

echo "CREATE DATABASE wordpress;" | mysql -u root

echo "CREATE USER 'molabhai'@'localhost' identified by 'molabhai';" | mysql -u root

echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'molabhai'@'localhost';" | mysql -u root

echo "FLUSH PRIVILEGES;" | mysql -u root

mysql -u root -p"\r" < localhost.sql

tar -xvzf latest.tar.gz -C /var/www/html

cp wp-config.php /var/www/html/wordpress/wp-config.php

chown -R www-data:www-data /var/www/html/wordpress

#For phpMyAdmin Installation

mkdir /var/www/html/phpmyadmin

tar xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin

cp config.inc.php /var/www/html/phpmyadmin/config.inc.php

chmod 660 /var/www/html/phpmyadmin/config.inc.php

chown -R www-data:www-data /var/www/html/phpmyadmin

cp nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key

cp nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt

cp dhparam.pem /etc/nginx/dhparam.pem

cp self-signed.conf /etc/nginx/snippets/self-signed.conf

cp ssl-params.conf /etc/nginx/snippets/ssl-params.conf

service nginx start

bash
