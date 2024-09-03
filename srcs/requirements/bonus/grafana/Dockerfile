# use the latest version of debian as base image
FROM debian:11

# mention me as the image-maintainer
LABEL maintainer="fheid@student.42vienna.com"

# install wget, dpkg and systemctl
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y apt-transport-https software-properties-common wget gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | tee -a /etc/apt/sources.list.d/grafana.list
RUN mkdir -p /etc/apt/keyrings/
RUN wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor > /etc/apt/keyrings/grafana.gpg
RUN chmod 644 /etc/apt/keyrings/grafana.gpg
RUN apt-get update
RUN apt-get install -y grafana

ENV HOME=/usr/share/grafana

# copy datasource config file
COPY ./conf/my_datasource.yml /usr/share/grafana/conf/provisioning/datasources/my_datasource.yml

# Expose port 3000
EXPOSE 3000

# start grafana-server
CMD ["grafana-server", "--config /usr/share/grafana/conf/defaults.ini", "--homepath /usr/share/grafana/"]