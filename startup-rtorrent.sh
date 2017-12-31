#!/bin/bash

set -x

# set rtorrent user and group id
RT_UID=${USR_ID:=1000}
RT_GID=${GRP_ID:=1000}

# update uids and gids
groupadd -g $RT_GID rtorrent
useradd -u $RT_UID -g $RT_GID -d /home/rtorrent -m -s /bin/bash rtorrent

# arrange dirs and configs
mkdir -p /incomplete
mkdir -p /complete
mkdir -p /rtorrent
mkdir -p /session
mkdir -p /watch
if [ ! -e /rtorrent/.rtorrent.rc ]; then
    cp /root/.rtorrent.rc /rtorrent/
fi
ln -s /rtorrent/.rtorrent.rc /home/rtorrent/
chown -R rtorrent:rtorrent /rtorrent
chown -R rtorrent:rtorrent /session
chown -R rtorrent:rtorrent /watch
chown -R rtorrent:rtorrent /home/rtorrent

rm -f /session/rtorrent.lock

# run
su \
  --login \
  --command="TERM=xterm rtorrent" \
  rtorrent
