#!/bin/bash
## grabsite-image/ep-application.sh
##=====< Application logic >=====##
echo "#[${0##*/}]" "Application phase running as: $(id) with HOME=$HOME"

## Ensure proper environment state:
export PATH="$PATH:$HOME/gs-venv/bin"
cd /grabsite/dl/wip

## DEV
# echo "#[${0##*/}]" "WARNING: DEV VERSION!"
# echo "#[${0##*/}]" "ENV"
# env
# echo "#[${0##*/}]" "/ENV" #&& exit 1

echo "#[${0##*/}]" "Starting pause/resume script"
/grabsite/pause_resume_grab_sites.sh &

echo "#[${0##*/}]" "Starting grab-site server process"
gs-server

echo "#[${0##*/}]" "Problem in entrypoint script, entering infinite loop to allow manual diagnostic commands..."
while true; do
    sleep 10
done

echo "#[${0##*/}]" "Application phase finished"
##=====< /Application logic >=====##
exit