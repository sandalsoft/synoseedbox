#!/bin/bash
docker run -d \
  --name rtorrent-rutorrent \
  -p 8080:80 \
  -p 51101:51101/udp \
  -p 51102:51102 \
  -p 5555:5555 \
  -v ~/incomplete:/incomplete \
  -v ~/complete:/complete \
  -v ~/watch:/watch \
  -v ~/session:/session \
  -v ~/rtorrent:/rtorrent \
  -v ~/rutorrent:/rutorrent \
  zszafran/rtorrent-rutorrent
