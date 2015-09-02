#!/usr/bin/env bash
set -e

if [[ "$1" = "start" ||  "$1" = 'sabnzbd' ]]; then
	/usr/bin/sabnzbdplus --config-file /config --console --server 0.0.0.0
fi

$@