#!/bin/bash
## entrypoint-app-plain.sh
echo "#[${0##*/}]" "Application running as: $(id) with HOME=$HOME"
set -v; set -x;

export PATH="$PATH:$HOME/gs-venv/bin"



echo "#[${0##*/}]" "Start background pause/resume script"
/grabsite/pause_resume_grab_sites.sh &

echo "#[${0##*/}]" "Start gs-server"
gs-server
exit