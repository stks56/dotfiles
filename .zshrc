# zsh
alias ls='ls -G'

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# vscode
export PATH=/usr/local/bin/code:$PATH

# node
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Add .NET Core SDK tools
export PATH=$HOME/.dotnet/tools:$PATH

# mise
# eval "$(mise activate zsh)"
export PATH="$HOME/.local/share/mise/shims:$PATH"

# go
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH=$PATH:$HOME/.local/share/mise/installs/go/latest/bin
