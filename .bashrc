#macOS default
#[ -n "$PS1" ] && source ~/.bash_profile;
# RHEL-like PS1
#export PS1="[\u@\h \w]\\$ "

# Ubuntu-like PS1
# Ubuntu-like PS1
#export PS1="\[\e]0;\u@\h: \w\a\]"
if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi

export CLICOLOR=1

# Suppress zsh default shell message in macOS
# https://apple.stackexchange.com/questions/371997/suppressing-the-default-interactive-shell-is-now-zsh-message-in-macos-catalina
export BASH_SILENCE_DEPRECATION_WARNING=1
