# Python 3.7
PATH=~/Library/Python/3.7/bin:$PATH
# brew git
PATH=/usr/local/Cellar/git/2.25.0/bin:$PATH
# vscode
PATH=/usr/local/bin/code:$PATH

export PATH

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
eval "$(rbenv init -)"
