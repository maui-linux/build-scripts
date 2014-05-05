netrunner-buildscripts
======================

Scripts need to build netrunner from Kubuntu master.

remaster-kit - To extract and and create a new remastering process
License: BSD

add-from-netrunner.sh - Netrunner packages to add 

remove-from-kubuntu.sh - Kubuntu packages to remove from Kubuntu Master

----------------------

To actually get a remaster going please refere to remaster-kit help. 
For netrunner packages to successfully install first it is necessary to
install the netrunner-sourceslist package manually in chroot. 
After that remove-from-kubuntu.sh and add-from-netrunner.sh can be run 
in the remaster-kit chroot environment. 