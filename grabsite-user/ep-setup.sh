#!/bin/bash
## ep-setup.sh
##=====< Preparation >=====##
## Preparation code runs as root.
echo "#[${0##*/}]" "Preparation phase running as: $(id) with HOME=$HOME"

echo "#[${0##*/}]" "Setup dirs"
## Volume mountpoint needs to be writable for application user:
mkdir -vp '/grabsite' '/grabsite/dl' '/grabsite/dl/wip' '/grabsite/dl/done' '/grabsite/cmd'
## Permissions for dirs:
chown -vR '1000:1000' '/grabsite' '/grabsite/dl' '/grabsite/dl/wip' '/grabsite/dl/done' '/grabsite/cmd'
chmod -v 'u=rwX,g=rwX,o=rwX' '/grabsite' '/grabsite/dl' '/grabsite/dl/wip' '/grabsite/dl/done' '/grabsite/cmd'

echo "#[${0##*/}]" "Setup scripts"
chmod -v 'u+x,g+x' /grabsite/*.sh

echo "#[${0##*/}]" "Preparation phase finished"
##=====< /Preparation >=====##
exit