#!/bin/bash
## entrypoint.sh
## Docker container entrypoint
echo "#[${0##*/}]" "Starting"
set -v; set -x;

echo "#[${0##*/}]" "Run setup as root"
/grabsite/ep-setup.sh

## All application code is run as non-root user:
echo "#[${0##*/}]" "Run application as lower priv user"
su "grabsite" /grabsite/ep-application.sh

echo "#[${0##*/}]" "Finished"
exit;
##=====< Notes >=====##