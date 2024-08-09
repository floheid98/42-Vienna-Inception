# use the latest version of debian as base image
FROM debian:11

# mention me as the image-maintainer
LABEL maintainer="fheid@student.42vienna.com"

# install mariadb-server
RUN apt-get -y update && apt-get -y install mariadb-server

# copy healthcheck.sh, setup.sh and config-files from host to image-vm
RUN echo "START"
COPY ./files/healthcheck.sh /healthcheck.sh
COPY ./files/setup.sh /setup.sh
COPY ./files/my.cnf /etc/mysql/my.cnf
COPY ./files/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN echo "ENDE"

RUN chmod +x /healthcheck.sh

# expose port 3306 as connection to wordpress
EXPOSE 3306

ENTRYPOINT ["mysqld_safe"]