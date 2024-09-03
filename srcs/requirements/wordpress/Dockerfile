# use the latest version of debian as base image
FROM debian:11

# mention me as the image-maintainer
LABEL maintainer="fheid@student.42vienna.com"

# install php-fpm, php-mysql and wget
RUN apt-get -y update && apt-get -y install php-fpm php-mysql wget

# download wp-cli, make it executable and move it in PATH
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# copy nginx-configfile and index.html from host to image-vm
COPY ./tools/setup.sh /setup.sh
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir /run/php

# expose port 9000
EXPOSE 9000

# execute setup-bash script
CMD ["/bin/bash", "setup.sh"]
