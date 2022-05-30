# Resuming

```
## Decide where to put things
JOBNAME=
DIR="/grabsite/jobs-wip/${JOBNAME}"
FINISHED_WARC_DIR="/grabsite/jobs-done/${JOBNAME}"
mkdir -vp "${DIR}" "${FINISHED_WARC_DIR}"

## Prepare dir and invocation:
grab-site --which-wpull-command --dir=$DIR --finished-warc-dir=$FINISHED_WARC_DIR $@ | tee -a "${cmdfile}"

## Append cleanup actions:
echo "mv ${cmdfile} old/${cmdfile}" | tee -a "${cmdfile}"
echo "mv ${cmdfile} old/${cmdfile}" | tee -a "${cmdfile}"

## Begin job:
chmod +x "${cmdfile}"
"${cmdfile}"
```


## Process
```
cmd/
wip/
done/
```

* Prepare job dir and invocation
*
* Move invocation to cmd/old/