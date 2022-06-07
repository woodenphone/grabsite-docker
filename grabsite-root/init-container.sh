#!/bin/bash
## init-container.sh
## Script to create image and container from within the host OS.
## USAGE: $ sudo ./init-container.sh
echo "#[${0##*/}]" "Starting"

echo "#[${0##*/}]" "Preparing host mount location"
sudo mkdir -vp "/docker/grabsite-root/dl"
sudo chmod -v -R 'a=rwX'  "/docker/grabsite-root"

echo "#[${0##*/}]" "Cleaning up"
rm -v "$PWD/grabsite.cid" "/docker/grabsite-root/grabsite.cid"

echo "#[${0##*/}]" "Creating container"
sudo docker run \
    --cidfile "/docker/grabsite-root/grabsite.cid" \
    --volume "/docker/grabsite-root/dl:/grabsite/dl:z" \
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
##     --expose "29000" \