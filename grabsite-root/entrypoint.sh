#!/bin/bash
## entrypoint.sh
## Docker container entrypoint
echo "#[${0##*/}]" "Starting"
set -v; set -x;


##=====< Preparation >=====##
## Preparation code runs as root.
echo "#[${0##*/}]" "Preparation phase running as: $(id) with HOME=$HOME"

echo "#[${0##*/}]" "Setup dirs"
## Volume mountpoint needs to be writable for application user:
mkdir -vp '/grabsite' '/grabsite/dl' '/grabsite/dl/wip' '/grabsite/dl/done' '/grabsite/cmd'
## Permissions for dirs:
chown -vR '1000:1000' '/grabsite' '/grabsite/dl' '/grabsite/dl/wip' '/grabsite/dl/done' '/grabsite/cmd'
chmod -v 'a=rwX' '/grabsite' '/grabsite/dl' '/grabsite/dl/wip' '/grabsite/dl/done' '/grabsite/cmd'

echo "#[${0##*/}]" "Setup scripts"
chmod -v 'u+x,g+x' /grabsite/*.sh

echo "#[${0##*/}]" "Preparation phase finished"
##=====< /Preparation >=====##
## All application code is run as non-root user:
echo "#[${0##*/}]" "Run application as lower priv user"
sudo -u "grabsite" /grabsite/entrypoint-app-plain.sh


echo "#[${0##*/}]" "Problem in entrypoint script, entering infinite loop to allow manual diagnostic commands..."
while true; do
    sleep 10
done



echo "#[${0##*/}]" "Finished"
exit;
##=====< Notes >=====##
## https://www.man7.org/linux/man-pages/man1/tmux.1.html