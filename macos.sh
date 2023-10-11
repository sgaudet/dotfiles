#!/usr/bin/env bash

# ~/.macos — https://mths.be/macos - Heavily influenced by

# Get SSH pub key
#curl https://github.com/sgaudet.keys | tee -a ~/.ssh/authorized_keys

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Don't write .DS_Store
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
#sudo scutil --set ComputerName "macbook"
#sudo scutil --set HostName "macbook"
#sudo scutil --set LocalHostName "macbook"
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "macbook"

# Disable automatic capitalization
#defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Hide Dock
defaults write com.apple.dock autohide -bool true;killall Dock

# Reset Dock to default settings
#defaults delete com.apple.dock; killall Dock

#TODO: Show Bluetooth & Volume
# https://community.jamf.com/t5/jamf-pro/show-bluetooth-in-menu-bar/m-p/243945
#defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: show hidden files by default
#defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
#defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
#defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
#defaults write com.apple.finder ShowPathbar -bool true

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
#defaults write com.apple.dock persistent-apps -array

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

#TODO
# https://github.com/mathiasbynens/dotfiles/blob/66ba9b3cc0ca1b29f04b8e39f84e5b034fdb24b6/.macos#L622
# Terminal profile: https://superuser.com/questions/1269613/how-to-change-macos-terminal-app-settings-programmatically
# Solarized: https://ethanschoonover.com/solarized/

###############################################################################
# Rectangle.app                                                               #
###############################################################################a

# Set up preferred keyboard shortcuts
cp -r init/RectangleConfig.json ~/Library/Application\ Support/Rectangle/RectangleConfig.json 2> /dev/null

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Photos" \
	"Rectangle" \
	"Safari" \
	"SystemUIServer" \
	"Terminal" \
	"iCal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
