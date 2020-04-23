# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
