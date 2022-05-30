#!/bin/bash
## job-create.sh
## Script to start a grab-site job in the container.
echo "#[${0##*/}]" "Starting"

## Decide where to put things
JOBNAME="$(date +%s)"
DIR="/grabsite/dl/wip/${JOBNAME}" # Where things go when they are not completed yet.
FINISHED_WARC_DIR="/grabsite/dl/done/${JOBNAME}" # Where things go upon completion.
CMD_DIR="/grabsite/dl/cmd/${JOBNAME}" # Where command files go.

## Create required dirs
mkdir -vp "${DIR}" "${FINISHED_WARC_DIR}" "${CMD_DIR}"

## Prepare dir and invocation:
grab-site --which-wpull-command --dir=$DIR --finished-warc-dir=$FINISHED_WARC_DIR $@ | tee -a "${cmdfile}" #>/dev/null

## Append cleanup actions to job script:
echo "mv -v ${cmdfile} ${DIR} ${FINISHED_WARC_DIR}" | tee -a "${cmdfile}" #>/dev/null

## Begin job:
chmod -v +x "${cmdfile}"
#./"${cmdfile}"

echo "#[${0##*/}]" "Finished"
exit