#!/bin/bash
## init-container.sh
## Script to create image and container from within the host OS.
## USAGE: $ sudo ./init-container.sh
echo "#[${0##*/}]" "Starting"

mkdir -vp "$PWD/cmd" "$PWD/download"

sudo docker run \
    --cidfile "$PWD/grabsite.cid" \
    --mount "type=bind,src=$PWD/download,dst=/grabsite/download" \
    --mount "type=bind,src=$PWD/cmd,dst=/grabsite/cmd" \
    --expose "127.0.0.1:29000" \
    --label "name=grabsite" \
    --name "grabsite"
    --restart "always"
    --tty \
    "grab-site"

echo "#[${0##*/}]" "Finished"
exit
##=====< Notes >=====##
## https://docs.docker.com/engine/reference/commandline/run/
## https://docs.docker.com/engine/reference/commandline/service_create/#add-bind-mounts-volumes-or-memory-filesystems