#!/bin/bash
## entrypoint.sh
## Docker container entrypoint
echo "#[${0##*/}]" "Starting"

/grabsite/pause_resume_grab_sites.sh &
gs-server

echo "#[${0##*/}]" "Finished"
exit
##=====< Notes >=====##