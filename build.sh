#!/bin/bash
OLD_VERSION=`cat .version`
VERSION=$((OLD_VERSION + 1))
echo $VERSION > .version
echo "Running build v$VERSION"

IMAGE_NAME='synoseedbox'
TORRENT_IMAGE="sandalsoft/$IMAGE_NAME"
IMAGE_FILE="$IMAGE_NAME.v$VERSION.tar"
WORKING_DIR="/Users/enelson/Development/_torrents/$TORRENT_IMAGE"
BUILD_DIR="$WORKING_DIR/build"
HOSTED_DIR="/Volumes/docker/sandalsoft_synoseedbox"


set -e
set -x

# Use the cache or not
#docker build $1 $2 -t "$TORRENT_IMAGE:latest" .
docker build --no-cache $1 $2 -t "$TORRENT_IMAGE:latest" .
docker save -o $BUILD_DIR/$IMAGE_FILE $TORRENT_IMAGE
rsync --progress $BUILD_DIR/$IMAGE_FILE $HOSTED_DIR