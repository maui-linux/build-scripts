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

function install_steam {

echo " -------------------------------------"
echo "Steam installation"
echo " -------------------------------------"
exec_in_chroot "wget -c http://media.steampowered.com/client/installer/steam.deb -O /tmp/steam.deb" ;
exec_in_chroot "dpkg -i /tmp/steam.deb" ;
exec_in_chroot "apt-get install -f" ;

}

if [ -e $BUILD_DIR/packages-add.txt ]; then
	packages_to_add=`cat $BUILD_DIR/packages-add.txt | tr -t '\n' ' '`
	install_gtalk_plugin
	exec_in_chroot "dpkg --add-architecture i386" # Necessary for skype
	exec_in_chroot "apt-get update"
        install_steam
	exec_in_chroot "apt-get dist-upgrade"
	exec_in_chroot "apt-get install $packages_to_add"
	exec_in_chroot "apt-get install base-files=7.2ubuntu9+netrunner8"
	exec_in_chroot "apt-get install ubiquity=2.21.23-netrunner3 ubiquity-slideshow-netrunner ubiquity-frontend-kde=2.21.23-netrunner3 ubiquity-ubuntu-artwork=2.21.23-netrunner3"
	exec_in_chroot "update-initramfs -u"
        exec_in_chroot "apt-get autoremove" # Remove old kernel versions and unneeded stuff
        exec_in_chroot "apt-get remove brasero brasero-cdrkit brasero-common libbrasero-media3-1 libreoffice-style-breeze nautilus nautilus-sendto" # Remove brasero installed by packagelist-add.txt (TODO: maybe --no-install-recommends)
fi
