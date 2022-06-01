#!/bin/bash
## entrypoint-app.sh
echo "#[${0##*/}]" "Application running as: $(id) with HOME=$HOME"

export PATH="$PATH:$HOME/gs-venv/bin"

echo "#[${0##*/}]" "Create detached tmux session"
## new-session -d [-c start-directory] [-s session-name] [-e environment]
tmux new-session -d -c "/grabsite/dl" -s "gs"

echo "#[${0##*/}]" "Start detached pause/resume script"
tmux new-window -d -n "gs_pause" /grabsite/pause_resume_grab_sites.sh

echo "#[${0##*/}]" "Start attached gs-server"
tmux new-window -n "gs_server" gs-server \; exit