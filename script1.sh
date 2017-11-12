#/bin/bash
if [[ $# = 0 ]]; then
 echo "invoke with mountpoint as first parameter eg:  $0 /mnt"
 exit 1
fi
# verbosemode on
set -v
test -f $1/config.txt || exit
cp $1/config.txt $1/config.txt.sik
touch $1/ssh
# append in lines with "console=" in it
sed -i.sik '/console=/ s/$/ modules-load=dwc2,g_ether/' $1/cmdline.txt
echo "dtoverlay=dwc2" >> $1/config.txt
