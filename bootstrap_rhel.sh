#!/bin/bash

curl https://github.com/sgaudet.keys | tee -a ~/.ssh/authorized_keys

PACKAGES="vim tmux git ansible htop strace"

dnf update
dnf install -y $PACKAGES
