# use the latest version of debian as base image
FROM debian:11

# mention me as the image-maintainer
LABEL maintainer="fheid@student.42vienna.com"

# install adminer
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install vsftpd

# copy config-file from host to image-vm
COPY ./tools/script.sh /script.sh
COPY ./conf/vsftpd.conf /etc/vsftpd.conf

# expose standart ftp port 21 and ports 10000-10099
EXPOSE 21
EXPOSE 64000-64321

# execute php with adminer
CMD ["/bin/bash", "script.sh"]