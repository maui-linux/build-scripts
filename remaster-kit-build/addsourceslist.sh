#!/bin/bash 

source /usr/share/remaster-kit/functions

if [ -e edit ] && [ -e $BUILD_DIR/sourceslist.deb ]; then
	cp $BUILD_DIR/sourceslist.deb edit/tmp/sourceslist.deb
	exec_in_chroot "dpkg -i /tmp/sourceslist.deb"
	exec_in_chroot "rm /etc/apt/sources.list" # Make sure to remove that so we don't have duplicates
	cp $BUILD_DIR/keyring.deb edit/tmp/keyring.deb
	exec_in_chroot "dpkg -i /tmp/keyring.deb"
	exec_in_chroot "apt-get update"
	rm edit/tmp/sourceslist.deb
fi
