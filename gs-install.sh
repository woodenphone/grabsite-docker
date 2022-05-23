#!/bin/bash
## gs-install.sh
## This is run via the dockerfile!
## See: https://github.com/ArchiveTeam/grab-site
echo "#[${0##*/}]" "Starting"
cd ~
ls -lahnFQZ

wget https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer
chmod +x pyenv-installer
./pyenv-installer
~/.pyenv/bin/pyenv install 3.8.13
~/.pyenv/versions/3.8.13/bin/python -m venv ~/gs-venv
~/gs-venv/bin/pip install --no-binary lxml --upgrade git+https://github.com/ArchiveTeam/grab-site

tee -a ~/.bashrc << EOF_BASHRC
PATH="$PATH:$HOME/gs-venv/bin"
EOF_BASHRC

ls -lahnFQZ
echo "#[${0##*/}]" "Finished"
exit
##=====< Notes >=====##
## https://github.com/ArchiveTeam/grab-site