#!/usr/bin/env bash

# Get SSH key
#curl https://github.com/sgaudet.keys | tee -a ~/.ssh/authorized_keys

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "brew.sh" \
		--exclude "rhel.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

# run macOS setup
if [ "$(uname)" == "Darwin" ]; then
  ./brew.sh
  # Death to .DS_Store
  defaults write com.apple.desktopservices DSDontWriteNetworkStores true
fi
# run RHEL setup
if [ -e /etc/redhat-release ]; then
  ./rhel.sh
fi
