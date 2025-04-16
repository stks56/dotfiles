# zsh alias
alias g='git'
alias k='kubectl'
alias h='history'
alias hsf="history | tail -r | fzf"
alias hsc="history | tail -r | fzf | awk '{\$1=\"\"; print substr(\$0,2)}' | tr -d '\n' | pbcopy"
alias fzfc="fzf | tr -d '\n' | pbcopy"
alias convert_unix_time='function _convert_unix_time() { date -r $(echo "$1 / 1000" | bc) +"%Y-%m-%d %H:%M:%S"; }; _convert_unix_time'
alias vi="nvim"
alias vim="nvim"

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

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# zinit theme
zinit light ohmyzsh/ohmyzsh
zinit ice pick"themes/jonathan.zsh-theme" src"themes/jonathan.zsh-theme"
zinit light ohmyzsh/ohmyzsh
ZSH_THEME="jonathan"

# zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/history-search-multi-word
zinit light zsh-users/zsh-completions

# fzf
export FZF_DEFAULT_COMMAND='fd'
