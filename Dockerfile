FROM ubuntu:24.04


ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
EXPOSE 80
EXPOSE 443

RUN apt-get update && apt-get upgrade -y

RUN apt install wget -y
RUN wget -O ./install.sh https://raw.githubusercontent.com/nmisha/php-proxy/refs/heads/main/install.sh


RUN chmod +x ./install.sh

RUN ./install.sh -y

RUN rm ./install.sh

