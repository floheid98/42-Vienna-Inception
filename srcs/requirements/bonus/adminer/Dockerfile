# use the latest version of debian as base image
FROM debian:11

# mention me as the image-maintainer
LABEL maintainer="fheid@student.42vienna.com"

# install adminer
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install php php-mysql

# copy config-file from host to image-vm
COPY ./conf/index.php /index.php

# expose port 8080
EXPOSE 8080

# execute php with adminer
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/"]