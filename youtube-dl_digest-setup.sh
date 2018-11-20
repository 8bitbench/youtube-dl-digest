#!/bin/bash

ROOT_BIT=`whoami`
if [ $ROOT_BIT != "root" ]
  then
    echo "you need to be root"; exit
fi
#setting up the install directory
CONTAINER_DATA="$1"
if [ -z $CONTAINER_DATA  ]
  then
    echo "you need to provide a directory for container data"
    echo "Example: /storage/container_data/ "; exit
fi

APP_NAME="youtube-dl-digest"
BASE_DIR="$CONTAINER_DATA/$APP_NAME"
DATA_DIR="$CONTAINER_DATA/$APP_NAME/data"
APP_DIR="$CONTAINER_DATA/$APP_NAME/app"
LOGS_DIR="$APP_DIR/logs"

for DIR_TEMP in $DATA_DIR $APP_DIR $LOGS_DIR
  do
      if [ ! -z $DIR_TEMP ]
        then
          mkdir -p $DIR_TEMP
      fi
  done

#transfering over the files the app needs. 
for FILE in $(cat app_files.txt)
  do 
    cp -r  $FILE $APP_DIR/
  done

chown media:media -R $BASE_DIR

#clean up the old container. 
docker rm -f youtube-dl-digest 2>&1 >/dev/null

#create the new container
docker run -it --name $APP_NAME \
        -v $DATA_DIR:/toolbox/data \
        -v $APP_DIR:/toolbox/app \
        --restart=unless-stopped \
        -d 8bitbench/$APP_NAME:16.04
