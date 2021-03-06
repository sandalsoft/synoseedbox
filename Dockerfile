FROM ubuntu:trusty
USER root

# add extra sources
ADD ./extra.list /etc/apt/sources.list.d/extra.list

# install
RUN apt-get update && \
    apt-get install -y --force-yes rtorrent unzip unrar mediainfo curl php5-fpm php5-cli php5-geoip nginx wget ffmpeg supervisor && \
    rm -rf /var/lib/apt/lists/*

# configure nginx
ADD rutorrent-*.nginx /root/

# download rutorrent
RUN mkdir -p /var/www && \
    wget --no-check-certificate https://github.com/Novik/ruTorrent/archive/v3.8.zip && \
    unzip v3.8.zip && \
    mv ruTorrent-3.8 /var/www/rutorrent && \
    rm v3.8.zip

ADD ./config.php /var/www/rutorrent/conf/

# add rutorrent autotools config file with 5s interval
ADD ./rutorrent.autotools.conf /var/www/rutorrent/plugins/autotools/conf.php

# add startup scripts and configs
ADD startup-rtorrent.sh startup-nginx.sh startup-php.sh .rtorrent.rc /root/

# configure supervisor
ADD supervisord.conf /etc/supervisor/conf.d/

EXPOSE 80
EXPOSE 51101
EXPOSE 51102

RUN mkdir -p /in_progress ; chown 1000:1000 /in_progress
RUN mkdir -p /rutorrent ; chown 1000:1000 /rutorrent
VOLUME /in_progress
VOLUME /data
VOLUME /watch
VOLUME /session
VOLUME /rtorrent
VOLUME /rutorrent

CMD ["supervisord"]
