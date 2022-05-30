#!/bin/bash
## cleanup.sh
## Remove container(s) for new testrun.
## WIP
echo "#[${0##*/}]" "Starting"


echo "#[${0##*/}]" "Get container ID"
CID=$(cat "$PWD/grabsite.cid")


echo "#[${0##*/}]" "Stop container(s)"
sudo docker kill "${CID}"


echo "#[${0##*/}]" "Delete container(s)"
sudo docker rm "${CID}"


echo "#[${0##*/}]" "Remove clutter files"
rm -vf *.cid



echo "#[${0##*/}]" "Finished"
exit
##=====< Notes >=====##
##