FROM  debian:10

COPY /srcs/install.sh . 

COPY /srcs/test.sh . 

COPY /srcs/select.exp . 

COPY /srcs/root.exp . 

COPY /srcs/default .

COPY /srcs/config.inc.php .

COPY /srcs/wp-config.php .

COPY /srcs/localhost.sql .

COPY /srcs/nginx-selfsigned.key .

COPY /srcs/nginx-selfsigned.crt .

COPY /srcs/dhparam.pem .

COPY /srcs/self-signed.conf .

COPY /srcs/ssl-params.conf .

RUN sh install.sh

CMD ["sh", "test.sh"]
