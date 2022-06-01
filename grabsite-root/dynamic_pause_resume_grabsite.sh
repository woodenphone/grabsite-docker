#!/bin/bash
## dynamic_pause_resume_grabsite.sh
## Pause and resume grab-site based on disk availibility, allowing config changes on-the-fly.
echo "#[${0##*/}]" "Starting" >&2

##=====< Filepaths and Defaults >=====##
## Config var files:
CONF_DIR="$PWD/pause-resume"
F_LOW_DISK_KB="${CONF_DIR}/LOW_DISK_KB"
F_PARTITION="${CONF_DIR}/PARTITION"
F_CHECK_INTERVAL_SEC="${CONF_DIR}/CHECK_INTERVAL_SEC"

## Defaults:
D_LOW_DISK_KB=$((80 * 1024 * 1024)) # Default: 80GB
D_PARTITION="/grabsite/dl"
D_CHECK_INTERVAL_SEC=60
##=====< /Filepaths and Defaults >=====##

# Track whether *we* paused the grab-sites to avoid (typically) resuming
# grab-sites that were paused by the user with e.g. ctrl-z
paused=0

## Main loop:
while true; do
	##=====< Update config >=====##
	## (Use default and write to file if file invalid or absent.)
	## Must be: Integer
	if [[ ! $(cat "${F_LOW_DISK_KB}") ~ '^[0-9]+$' ]]; then
		echo -n "${D_LOW_DISK_KB}" > "${F_LOW_DISK_KB}"
		LOW_DISK_KB=$(cat "${F_LOW_DISK_KB}")
		echo "#[${0##*/}]" "LOW_DISK_KB=LOW_DISK_KB" >&2
	fi
	## Must be: Non-empty string
	if [[ $(cat "${F_PARTITION}") -z ]]; then
		echo -n "${D_PARTITION}" > "${F_PARTITION}"
		PARTITION=$(cat "${F_PARTITION}")
		echo "#[${0##*/}]" "PARTITION=PARTITION" >&2
	fi
	## Must be: Integer
	if [[ ! $(cat "${F_CHECK_INTERVAL_SEC}") ~ '^[0-9]+$' ]]; then
		echo -n "${D_CHECK_INTERVAL_SEC}" > "${F_CHECK_INTERVAL_SEC}"
		CHECK_INTERVAL_SEC=$(cat "${F_CHECK_INTERVAL_SEC}")
		echo "#[${0##*/}]" "CHECK_INTERVAL_SEC=$CHECK_INTERVAL_SEC" >&2
	fi
	##=====< /Update config >=====##
	##=====< Pause/unpause grabsite >=====##
	left=$(df "$PARTITION" | grep / | sed -r 's/ +/ /g' | cut -f 4 -d ' ')
	if [[ $paused = 1 ]] && (( left >= $LOW_DISK_KB )); then
		echo "#[${0##*/}]" "Disk OK, resuming all grab-sites" >&2
		paused=0
		killall -CONT grab-site
	fi
	if (( left < $LOW_DISK_KB )); then
		echo "#[${0##*/}]" "Disk low, pausing all grab-sites" >&2
		paused=1
		killall -STOP grab-site
	fi
	##=====< Pause/unpause grabsite >=====##
	echo -n ". " >&2
	sleep "$CHECK_INTERVAL_SEC"
done

echo "#[${0##*/}]" "Finished" >&2
exit
##=====< Notes >=====##
## Based on: https://github.com/ArchiveTeam/grab-site/blob/master/extra_docs/pause_resume_grab_sites.sh
## Send all output to stderr for compatability as subscript.