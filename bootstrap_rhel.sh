#!/bin/bash

curl https://github.com/sgaudet.keys | tee -a ~/.ssh/authorized_keys
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh | tee -a ~/.git-prompt.sh

PACKAGES="vim tmux git ansible htop strace"

dnf update
dnf install -y $PACKAGES
