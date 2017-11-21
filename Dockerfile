FROM ubuntu:16.04
MAINTAINER Kwanki Ahn(kwanki.ahn@samsung.com)
RUN apt-get update
RUN apt-get -y install apt-transport-https
RUN apt-get -y install redis-server
ADD start.sh /
RUN chmod u+x /start.sh
WORKDIR /etc/redis
ENTRYPOINT /start.sh
EXPOSE 6379

