FROM ubuntu as build1

USER root

#WORKDIR /app

RUN apt update

RUN apt install -y apache2

RUN apt install -y mysql-client

COPY energym-html/ /var/www/html/

COPY hello.txt .

#RUN service apache2 start 

FROM httpd:2.4

WORKDIR /app

COPY --from=build1 . /app

#RUN mysql  

CMD apachectl -D FOREGROUND
