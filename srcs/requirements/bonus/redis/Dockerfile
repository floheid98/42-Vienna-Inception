# use the latest version of debian as base image
FROM debian:11

# mention me as the image-maintainer
LABEL maintainer="fheid@student.42vienna.com"

# install redis-server
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install redis-server

# copy config-file from host to image-vm
COPY ./conf/redis.conf /etc/redis/redis.conf

# expose port 6379 as connection to wordpress
EXPOSE 6379

# execute setup-bash script
CMD ["redis-server", "--protected-mode", "no"]