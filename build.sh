#!/bin/bash
TORRENT_IMAGE='sandalsoft/synoseedbox'
WORKING_DIR="/Users/enelson/Development/_torrents/$TORRENT_IMAGE"
set -e
set -x
docker build $1 $2 -t "$TORRENT_IMAGE:latest" .
docker save -o $WORKING_DIR $TORRENT_IMAGE
