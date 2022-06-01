#!/bin/bash
## testrun.sh
echo "#[${0##*/}]" "Starting"

## Use 'strict mode' for BASH to avoid bugs that can break something
set -euo pipefail ## https://devhints.io/bash
IFS=$'\n\t' ## http://redsymbol.net/articles/unofficial-bash-strict-mode/

./cleanup.sh
./build-image.sh
./init-container.sh
echo "#[${0##*/}]" "Finished"
exit
##=====< Notes >=====##
##