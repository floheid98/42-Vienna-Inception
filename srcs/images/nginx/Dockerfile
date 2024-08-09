# use the latest version of debian as base image
FROM debian:11

# mention me as the image-maintainer
LABEL maintainer="fheid@student.42vienna.com"

# install nginx and openssl, create directory for ssl-files, create ssl-certificate and ssl-key
RUN apt-get -y update && apt-get -y install nginx openssl
RUN mkdir -p /etc/ssl/nginx/
RUN openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout /etc/ssl/nginx/nginx.key -out /etc/ssl/nginx/nginx.crt -subj "/C=AU/ST=VIENNA/L=VIENNA/O=42/CN=fheid"

# copy nginx-configfile and index.html from host to image-vm
COPY ./files/default /etc/nginx/sites-enabled/default
COPY ./files/index.html /var/www/html/index.html

# expose port 443 as entrypoint into the infrastructure
EXPOSE 443

# execute nginx and make sure that it is not detached into background
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
