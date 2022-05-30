#!/bin/bash
## Script to start a grab-site job in the container.
echo "#[${0##*/}]" "Starting"

CONTAINER="grabsite" # Name of grabsite container.
cmdfile="/grabsite/cmd/$(date +%s).sh"

## Run in tmux to ensure grabsite client process remains alive until it completes.
## $ docker exec [OPTIONS] CONTAINER COMMAND [ARG...]
sudo docker exec --user 1000:1000 --workdir "/grabsite/dl" "${CONTAINER}" tmux new-window << GS_EOF
grab-site --which-wpull-command $@ | tee "${cmdfile}"
chmod +x "${cmdfile}"
"${cmdfile}"
GS_EOF

echo "#[${0##*/}]" "Finished"
exit
##=====< Notes >=====##
## https://github.com/ArchiveTeam/grab-site
## https://docs.docker.com/engine/reference/commandline/exec/