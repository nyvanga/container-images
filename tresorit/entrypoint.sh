#!/bin/sh
set -e

echo "\e[91m=====\e[0m Starting tresorit cli \e[91m=====\e[0m"
tresorit-cli start
tresorit-cli status

echo "\e[91m=====\e[0m Disabling logging \e[91m=========\e[0m"
tresorit-cli logging --disable-log-sending
tresorit-cli logging --disable-metrics
tresorit-cli logging --status

echo "\e[91m=====\e[0m Logs \e[91m======================\e[0m"
tail -f Logs/* &
while file=$(inotifywait -e create -r Logs/ --format '%f' 2>/dev/null); do
	echo "==> Logs/$file <=="
	if [[ -f Logs/$file ]]; then
		tail -f Logs/$file &
	else
		echo "Logs/$file - not a file, skipping..."
	fi
done
