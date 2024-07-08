#!/bin/bash


dmgname="opera.dmg"
# arch=$(/usr/bin/arch)
temp=/private/tmp
URL="https://get.geo.opera.com/pub/opera/desktop/110.0.5130.49/mac/Opera_110.0.5130.49_Setup.dmg"


mkdir -p $temp/mount
curl -L $URL > $temp/$dmgname
yes | hdiutil attach -noverify -nobrowse -mountpoint $temp/mount $temp/$dmgname
if [ -e $temp/mount/*.app ]; then
	cp -r $temp/mount/*.app /Applications
elif [ -e $temp/mount/*.pkg ]; then
	installer -pkg $temp/mount/*.pkg -target / -allowUntrusted
fi
hdiutil detach $temp/mount
rm -r $temp/mount
rm -r $temp/opera.dmg

