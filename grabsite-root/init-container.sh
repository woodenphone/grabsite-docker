#!/bin/bash
## init-container.sh
## Script to create image and container from within the host OS.
## USAGE: $ sudo ./init-container.sh
echo "#[${0##*/}]" "Starting"

mkdir -vp "$PWD/dl"
rm -v "$PWD/grabsite.cid"
sudo docker run \
    --cidfile "$PWD/grabsite.cid" \
    --volume "$PWD/dl:/grabsite/dl:z" \
    --expose "29000" \
    --label "name=grabsite" \
    --name "grabsite-root" \
    --restart "always" \
    --tty \
    "grabsite-root"

echo "#[${0##*/}]" "Finished"
exit
##=====< Notes >=====##
## https://docs.docker.com/engine/reference/commandline/run/
## https://docs.docker.com/engine/reference/commandline/service_create/#add-bind-mounts-volumes-or-memory-filesystems
## -v <source>:<destination>:<options>