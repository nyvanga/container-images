#!/bin/bash

CODE_DIR=/code

GITLIST_VERSION=1.0.2
GITLIST_DIR=$CODE_DIR/gitlist

function php_install_create_init() {
	mkdir -p $CODE_DIR
}

function php_install_line() {
	local message=$1; shift
	echo -e "\e[33m===== $message =====\e[0m"
}

function php_install_create_phpinfo() {
	php_install_line "Creating phpinfo"
	mkdir -p $CODE_DIR/phpinfo
	cat > $CODE_DIR/phpinfo/index.php << EOF
<?php

// Show all information, defaults to INFO_ALL
phpinfo();

?>
EOF
}

function php_install_download() {
	local destination=$1; shift
	local url=$1; shift
	local archive=$CODE_DIR/tmp.tar.gz
	curl -SL $url -o $archive
	mkdir -p $destination
	tar -xzf $archive -C $destination/
	rm -f $archive
}

function php_install_download_gitlist() {
	php_install_line "Downloading gitlist"
	local url=https://github.com/klaussilveira/gitlist/releases/download/${GITLIST_VERSION}/gitlist-${GITLIST_VERSION}.tar.gz
	local archive=$CODE_DIR/gitlist.tar.gz
	curl -SL $url -o $archive
	tar -xzf $archive -C $CODE_DIR/
	rm -f $archive
}

function php_install_configure_gitlist_apache() {
	php_install_line "Configuring gitlist"
	rm -f $GITLIST_DIR/config.ini-example
}

function php_install_configure_gitlist_php() {
	php_install_line "Configuring gitlist"
	mkdir $GITLIST_DIR/cache
	chmod 777 $GITLIST_DIR/cache
	mv $GITLIST_DIR/config.ini-example $GITLIST_DIR/config.ini
	sed -i "s/repositories\[\] = '\/home\/git\/repositories\/'/repositories\[\] = '\/repos\/'/" $GITLIST_DIR/config.ini
	sed -i "s/; timezone = UTC/timezone = CET/" $GITLIST_DIR/config.ini
	sed -i "s/; format = 'd\/m\/Y H:i:s'/format = 'Y.m.d H:i:s'/" $GITLIST_DIR/config.ini
}

CMD=$1; shift
case "$CMD" in
	apache)
		php_install_create_init
		php_install_create_phpinfo
		php_install_download_gitlist
		php_install_configure_gitlist_apache
   	;;

	php)
		php_install_create_init
		php_install_create_phpinfo
		php_install_download_gitlist
		php_install_configure_gitlist_php
   	;;

	*)
		echo "Usage: $(basename $0) <apache|php>"
   	;;
esac