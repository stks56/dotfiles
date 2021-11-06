# vscode
export PATH=/usr/local/bin/code:$PATH

# rbenv
eval "$(rbenv init -)"

# go
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:$PATH

# goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
export PATH=$HOME/.goenv/bin:$PATH
eval "$(goenv init -)"
