
echo '[*] Deleting files..'
/bootstrap/bin/rm /callrecorder.tar 2>/dev/null
/bootstrap/bin/rm /install_callrecorder.tar 2>/dev/null

/bootstrap/bin/rm /usr/lib/SBInject/iOSCallRecorder.* 2>/dev/null
/bootstrap/bin/rm -R /Applications/CallRecorder.app 2>/dev/null

/bootstrap/bin/launchctl unload /bootstrap/Library/LaunchDaemons/org.hacx.hacxdaemon.plist 2>/dev/null
/bootstrap/bin/rm /bootstrap/Library/LaunchDaemons/org.hacx.hacxdaemon.plist 2>/dev/null
/bootstrap/bin/rm /bootstrap/usr/bin/hAcxDaemon 2>/dev/null
/bootstrap/bin/rm /bootstrap/usr/lib/libhAcxTools.dylib 2>/dev/null

echo '[*] Resetting Processes..'
uicache
/bootstrap/bin/launchctl load /bootstrap/Library/LaunchDaemons/org.hacx.hacxdaemon.plist
killall -9 mediaserverd InCallService SpringBoard

echo '[*] Cleaning..'
rm /uninstall_callrecorder.sh

echo '[*] Done'

