#!/bin/bash

# run from this directory
cd "$(dirname "$0")"

plist_path="daily.plist"
install_path="/Library/LaunchDaemons/net.artistan.brew-cooler.plist"

echo "installing launchctl plist: $plist_path --> $install_path"
sudo cp -f "$plist_path" "$install_path"
sudo chown root "$install_path"
sudo chmod 644 "$install_path"

# update the path to the script
sudo sed -i '' "s|__DIRNAME__|$PWD|" "$install_path"

sudo launchctl unload "$install_path"
sudo launchctl load "$install_path"

echo "to check if it's running, run this command: sudo launchctl list | grep wintr"
echo "to uninstall, run this command: sudo launchctl unload \"$install_path\""
