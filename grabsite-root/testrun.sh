#!/bin/bash
## testrun.sh
echo "#[${0##*/}]" "Starting"

## Use 'strict mode' for BASH to avoid bugs that can break something
set -euo pipefail ## https://devhints.io/bash
IFS=$'\n\t' ## http://redsymbol.net/articles/unofficial-bash-strict-mode/

./cleanup.sh || exit 1
./build-image.sh || exit 1
./init-container.sh || exit 1
echo "#[${0##*/}]" "Finished"
exit
##=====< Notes >=====##
##