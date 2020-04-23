#macOS default
#[ -n "$PS1" ] && source ~/.bash_profile;

#old default PS1
#export PS1="[\u@\h \w]\\$ "

. ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\u@mbp \w$(__git_ps1)]\$ '

export CLICOLOR=1