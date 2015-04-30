#!/bin/bash

source /usr/share/remaster-kit/functions

if [ -e $BUILD_DIR/packages-remove.txt ]; then
	packages_to_add=`cat $BUILD_DIR/packages-remove.txt | tr -d '\n'`
	exec_in_chroot "apt-get purge $packages_to_add"
        exec_in_chroot "apt-get autoremove"
fi
