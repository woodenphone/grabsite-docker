#!/bin/bash
## add-pyenv-to-bashprofile.sh
## This is run via the dockerfile!
## See: https://github.com/ArchiveTeam/grab-site
echo "#[${0##*/}]" "Starting"
echo "#[${0##*/}]" "Running as: $(id) with HOME=$HOME"
set -v; set -x;

##=====< Add venv + pyenv to PATH >=====##
## Append code to load pyenv automatically to each file.
cat 'PATH="$PATH:$HOME/gs-venv/bin"' | tee -a ~/.bashrc

##=====< /Add venv + pyenv to PATH >=====##

echo "#[${0##*/}]" "Finished"
exit
##=====< Notes >=====##
## https://github.com/ArchiveTeam/grab-site
## Heredocs MUST escape: '\', '$', '`' https://unix.stackexchange.com/questions/376103/here-document-without-interpreting-escape-sequences-but-with-interpolation