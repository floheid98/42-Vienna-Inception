# use the latest version of debian as base image
FROM debian:11

# mention me as the image-maintainer
LABEL maintainer="fheid@student.42vienna.com"

# install nginx and openssl, create directory for ssl-files, create ssl-certificate and ssl-key
RUN apt-get -y update && apt-get -y install nginx

# copy nginx-configfile and index.html from host to image-vm
COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools /var/www/html/website

# expose port 8070
EXPOSE 8070

# execute nginx and make sure that it is not detached into background
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
