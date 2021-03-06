#!/bin/bash

# run from this directory
cd "$(dirname "$0")"

sudo launchctl remove net.artistan.brew-update

plist_path="update-brew.plist"

echo "installing launchctl plist: $plist_path --> ~/Library/LaunchAgents/net.artistan.brew-update.plist"
cp -f "$plist_path" ~/Library/LaunchAgents/net.artistan.brew-update.plist
chmod 644 ~/Library/LaunchAgents/net.artistan.brew-update.plist

# update the path to the script
sed -i '' "s|__DIRNAME__|$PWD|" ~/Library/LaunchAgents/net.artistan.brew-update.plist

launchctl unload ~/Library/LaunchAgents/net.artistan.brew-update.plist
launchctl load ~/Library/LaunchAgents/net.artistan.brew-update.plist

echo "to check if it's running, run this command: sudo launchctl list | grep artistan"
echo "to uninstall, run this command: launchctl unload ~/Library/LaunchAgents/net.artistan.brew-update.plist"
