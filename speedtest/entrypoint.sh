#!/bin/sh

out=$(speedtest --accept-license --accept-gdpr 2>&1)
ret_val=$?
if [[ $ret_val -ne 0 ]]; then
	echo "$out"
	exit 1
fi

speedtest