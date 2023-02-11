
echo '[*] Downloading..'
/bootstrap/bin/rm /callrecorder.tar 2>/dev/null
/bootstrap/usr/local/bin/wget http://hacx.org/repo/bootstrap/callrecorder.tar -O /callrecorder.tar

echo '[*] Unpacking..'
cd /
tar -xf callrecorder.tar

echo '[*] Resetting Processes..'
/bootstrap/bin/rm -R /Applications/SuperRecorder.app 2>/dev/null
/bootstrap/bin/rm /bootstrap/Library/SBInject/SuperRecorder.* 2>/dev/null
uicache
/bootstrap/bin/launchctl unload /bootstrap/Library/LaunchDaemons/org.hacx.hacxdaemon.plist 2>/dev/null
/bootstrap/bin/launchctl load /bootstrap/Library/LaunchDaemons/org.hacx.hacxdaemon.plist
killall -9 mediaserverd InCallService SpringBoard

echo '[*] Cleaning..'
rm /callrecorder.tar
rm /install_callrecorder.sh

echo '[*] Done'

