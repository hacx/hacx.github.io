
echo '[*] Downloading..'
/bootstrap/bin/rm /superrecorder.tar 2>/dev/null
/bootstrap/usr/local/bin/wget http://hacx.org/repo/bootstrap/superrecorder.tar -O /superrecorder.tar

echo '[*] Unpacking..'
cd /
tar -xf superrecorder.tar

echo '[*] Resetting Processes..'
/bootstrap/bin/rm -R /Applications/CallRecorder.app 2>/dev/null
/bootstrap/bin/rm /bootstrap/Library/SBInject/iOSCallRecorder.* 2>/dev/null
uicache
/bootstrap/bin/launchctl unload /bootstrap/Library/LaunchDaemons/org.hacx.hacxdaemon.plist 2>/dev/null
/bootstrap/bin/launchctl load /bootstrap/Library/LaunchDaemons/org.hacx.hacxdaemon.plist
killall -9 mediaserverd InCallService SpringBoard

echo '[*] Cleaning..'
rm /superrecorder.tar
rm /install_superrecorder.sh

echo '[*] Done'

