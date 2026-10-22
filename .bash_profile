#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Load the optional local environment only when it exists.
if [ -r "$HOME/.local/share/../bin/env" ]; then
    . "$HOME/.local/share/../bin/env"
fi
