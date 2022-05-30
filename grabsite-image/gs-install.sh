#!/bin/bash
## gs-install.sh
## This is run via the dockerfile!
## See: https://github.com/ArchiveTeam/grab-site
echo "#[${0##*/}]" "Starting"
echo "#[${0##*/}]" "Running as: $(id) with HOME=$HOME"
set -v; set -x;

# echo "#[${0##*/}]" "ENV"
# env
# echo "#[${0##*/}]" "/ENV" #&& exit 1


cd $HOME
ls -lahnFQZ $HOME ~

wget https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer
chmod -v +x pyenv-installer
~/pyenv-installer
~/.pyenv/bin/pyenv install 3.8.13
~/.pyenv/versions/3.8.13/bin/python -m venv ~/gs-venv
~/gs-venv/bin/pip install --no-binary lxml --upgrade git+https://github.com/ArchiveTeam/grab-site

##=====< Add venv + pyenv to PATH >=====##
## Append code to load pyenv automatically to each file.
echo 'PATH="$PATH:$HOME/gs-venv/bin"' | tee -a ~/.bashrc

##=====< /Add venv + pyenv to PATH >=====##

ls -lahnFQZ $HOME

echo "#[${0##*/}]" "Finished"
exit
##=====< Notes >=====##
## https://github.com/ArchiveTeam/grab-site
## Heredocs MUST escape: '\', '$', '`' https://unix.stackexchange.com/questions/376103/here-document-without-interpreting-escape-sequences-but-with-interpolation