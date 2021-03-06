#!/bin/bash
## cleanup.sh
## Remove container(s) for new testrun.
## WIP
echo "#[${0##*/}]" "Starting"


echo "#[${0##*/}]" "Get container ID"
CID=$(cat "$PWD/grabsite.cid" "/docker/grabsite-root/grabsite.cid")
echo "#[${0##*/}]" "CID=$CID"

echo "#[${0##*/}]" "Stop container(s)"
sudo docker kill "${CID}" "grabsite-root"

echo "#[${0##*/}]" "Delete container(s)"
sudo docker rm "${CID}" "grabsite-root"

## TODO: Cleanup extra volumes related to container?

echo "#[${0##*/}]" "Remove clutter files"
rm -vf *.cid



echo "#[${0##*/}]" "Finished"
exit
##=====< Notes >=====##
##