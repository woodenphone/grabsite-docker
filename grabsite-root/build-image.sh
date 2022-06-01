#!/bin/bash
## build-image.sh
echo "#[${0##*/}]" "Starting"

# commit=$(git log --max-count=1 --no-decorate --format="GIT%h_@%at")
# sudo docker build  -t "grab-site:${commit}" "$PWD"
sudo docker build  -t "grabsite-root" .

echo "#[${0##*/}]" "Finished"
exit
##=====< Notes >=====##