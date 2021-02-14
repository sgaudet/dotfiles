#!/bin/bash

curl https://github.com/sgaudet.keys | tee -a ~/.ssh/authorized_keys
wget -O ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

PACKAGES="vim tmux git ansible htop strace"

dnf update
dnf install -y $PACKAGES
