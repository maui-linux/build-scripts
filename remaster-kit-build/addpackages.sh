#!/bin/bash

source /usr/share/remaster-kit/functions

function install_gtalk_plugin {

echo " -------------------------------------"
echo "googletalk-plugin installation"
echo " -------------------------------------"
read -p "Download and install 32bit or 64bit version? " answer  # TODO: This needs to be done in remaster-kit to not nag the user in autobuild
case "$answer" in
        *32*)
                echo "Downloading 32bit version ... "
		exec_in_chroot "wget -c http://dl.google.com/linux/direct/google-talkplugin_current_i386.deb -O /tmp/gtalk32bit.deb" ;
		  
                echo "Installing 32bit version ... "
                exec_in_chroot "dpkg -i /tmp/gtalk32bit.deb"
                ;;
        *64*)   echo "Downloading 64bit version ... "
		exec_in_chroot "wget -c http://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb -O /tmp/gtalk64bit.deb" ;
                echo "Installing 64bit version ... "
                exec_in_chroot "dpkg -i /tmp/gtalk64bit.deb"
                ;;
        *)
                echo "Aborting as no valid user input"
                ;;
esac

}

if [ -e $BUILD_DIR/packages-add.txt ]; then
	packages_to_add=`cat $BUILD_DIR/packages-add.txt`
	install_gtalk_plugin
	exec_in_chroot "dpkg --add-architecture i386" # Necessary for skype
	exec_in_chroot "apt-get update"
	exec_in_chroot "apt-get install $packages_to_add"
	exec_in_chroot "apt-get install base-files=6.12ubuntu5+netrunner6"
	exec_in_chroot "update-initramfs -u"
fi