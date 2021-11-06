# vscode
PATH=/usr/local/bin/code:$PATH

# rbenv
export PATH

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
eval "$(rbenv init -)"
