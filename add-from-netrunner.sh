#!/bin/bash
# 
# Install software for netrunner 
#
#


# From 1306 PPA
# apt-get install firefox firefox-kde-support plasma-widget-folderview plasma-widget-homerun libhomerun0 flickr-runner kde-config-gtk-style samba-mounter webaccounts akonadi-facebook kdepim-runtime libkfbapi1 libkgapi0 libmailtransport4
# # From Medibuntu
# apt-get install libdvdcss2 non-free-codecs kubuntu-restricted-extras ubuntu-restricted-extras ffmpeg kffmpegthumbnailer libavcodec-extra-53 libmp3lame0
# # From Ubuntu Universe
# apt-get install virtualbox-qt virtualbox-guest-additions-iso veromix-common plasma-widget-veromix plasma-scriptengine-python python-xdg python-qt4-dbus kio-mtp wine-gecko1.9 ndisgtk ndiswrapper-dkms vlc-plugin-pulse virtualbox-dkms samba cifs-utils libkgapi0 akonadi-kde-resource-googledata pavucontrol ndiswrapper-common ndiswrapper-utils-1.9 qtcurve thunderbird vlc filezilla qmmp virtualbox transmission-qt konqueror yakuake krita gimp pidgin synaptic acetoneiso kdenlive tomahawk calligraflow wine winetricks gtk-recordmydesktop muon-discover libreoffice libreoffice-gtk libreoffice-style-human openjdk-7-jre icedtea-7-plugin kscreensaver kscreensaver-xsavers kscreensaver-xsavers-extra ttf-mscorefonts-installer ttf-liberation kpart-webkit apturl-kde apturl-common winff gstreamer0.10-qapt gstreamer0.10-ffmpeg frei0r-plugins software-properties-gtk dmz-cursor-theme gnome-icon-theme gnome-icon-theme-full gtk2-engines gtk2-engines-murrine gtk2-engines-oxygen gtk3-engines-oxygen gtk3-engines-unico konversation 
# # Games
# apt-get install ktron aisleriot ksudoku glchess kbreakout kmines kmahjongg frozen-bubble kdiamond gnibbles gltron burgerspace a7xpg 
# # Archiving support
# apt-get install p7zip-full unrar 
# 
# apt-get install netrunner-wallpapers netrunner-settings-desktop netrunner-plymouth-theme-logo netrunner-plymouth-theme-text netrunner-default-wallpaper netrunner-firefox-settings netrunner-thunderbird-settings netrunner-artwork netrunner-grub-artwork netrunner-ubiquity-slideshow netrunner-lightdm-theme netrunner-icon-theme netrunner-icon-theme-extras netrunner-kwin-decoration-extras netrunner-cursor-theme-extras netrunner-plasma-theme-extras
# # skype adobe-flashplugin adobe-flash-properties-kde googletalk-plugin kio-sysinfo
# echo "skype googletalk-plugin kio-sysinfo"


# 14
# From Frontier PPA
apt-get install firefox firefox-kde-support plasma-widget-folderview plasma-widget-homerun libhomerun0 kde-config-gtk-style samba-mounter akonadi-facebook kdepim-runtime libkfbapi1 libmailtransport4 expanding-icons-taskmanager plasma-widget-smooth-tasks kio-sysinfo ksuperkey kubuntu-qtquick1-components simplescreenrecorder plasma-widget-toggle-panel
# Codecs and Flashplayer
apt-get install kubuntu-restricted-extras ubuntu-restricted-extras libav-tools kffmpegthumbnailer
# Universe
apt-get install virtualbox-qt virtualbox-guest-dkms virtualbox-guest-x11 veromix-common plasma-widget-veromix plasma-scriptengine-python python-xdg python-qt4-dbus kio-mtp ndisgtk ndiswrapper-dkms vlc-plugin-pulse virtualbox-dkms samba cifs-utils ndiswrapper-common ndiswrapper-utils-1.9 qtcurve thunderbird vlc filezilla qmmp transmission-qt konqueror yakuake krita gimp pidgin synaptic kdenlive clementine calligraflow muon-discover libreoffice libreoffice-gtk libreoffice-style-human openjdk-7-jre icedtea-7-plugin kscreensaver kscreensaver-xsavers ttf-mscorefonts-installer ttf-liberation fonts-roboto fonts-droid kpart-webkit apturl-kde apturl-common gstreamer1.0-libav frei0r-plugins software-properties-gtk dmz-cursor-theme gnome-icon-theme gnome-icon-theme-full gtk2-engines gtk2-engines-murrine gtk2-engines-oxygen gtk3-engines-oxygen gtk3-engines-unico konversation plasma-widget-homerun-kicker
# Games
apt-get install ktron glchess kbreakout kmines kmahjongg frozen-bubble kdiamond gltron burgerspace gnudoq kpat
# Archiving support
apt-get install p7zip-full unrar
# From Ubuntu Partner
apt-get install skype
echo " -------------------------------------"
echo "googletalk-plugin installation"
echo " -------------------------------------"
read -p "Download and install 32bit or 64bit version? " answer
case "$answer" in
        *32*)
                echo "Downloading 32bit version ... "
                TEST_WGET=$(which wget)
                if [ -n "$TEST_WGET" ]; then
		  $TEST_WGET -c http://dl.google.com/linux/direct/google-talkplugin_current_i386.deb -O /tmp/gtalk32bit.deb ;
		else 
		  TEST_CURL=$(which curl)
		  if [ -n "$TEST_CURL" ]; then
		    $TEST_CURL http://dl.google.com/linux/direct/google-talkplugin_current_i386.deb > /tmp/gtalk32bit.deb ;
		  else 
		    echo "No wget or curl installed to download. Please download and install http://dl.google.com/linux/direct/google-talkplugin_current_i386.deb manually"
		    exit 1
		  fi
		fi
                echo "Installing 32bit version ... "
                dpkg -i /tmp/gtalk32bit.deb
                ;;
        *64*)   echo "Downloading 64bit version ... "
		TEST_WGET=$(which wget)
                if [ -n "$TEST_WGET" ]; then
		  $TEST_WGET -c http://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb -O /tmp/gtalk64bit.deb ;
		else 
		  TEST_CURL=$(which curl)
		  if [ -n "$TEST_CURL" ]; then
		    $TEST_CURL http://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb > /tmp/gtalk64bit.deb ;
		  else 
		    echo "No wget or curl installed to download. Please download and install http://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb manually"
		    exit 1
		  fi
		fi
                echo "Installing 64bit version ... "
                dpkg -i /tmp/gtalk64bit.deb
                ;;
        *)
                echo "Aborting as no valid user input"
                ;;
esac