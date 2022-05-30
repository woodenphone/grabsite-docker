#!/bin/bash
## testrun.sh
echo "#[${0##*/}]" "Starting"
./cleanup.sh
./build-image.sh
./init-container.sh
echo "#[${0##*/}]" "Finished"
exit
##=====< Notes >=====##
##