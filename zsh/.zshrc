# Terminal Setup

## Env variables

### XDG Home
export XDG_CONFIG_HOME="$HOME/.files"

### Languages
NPM_PACKAGES="$HOME/.npm_packages"
export GOPATH=$HOME/go

### Path
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/bin"
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/go/bin
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
export DOCKER_CLIENT_TIMEOUT=240
export COMPOSE_HTTP_TIMEOUT=240
export PATH="$PATH:$HOME/.local/bin"

### NVIM init.vim path
export MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim"

## Language Support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

## Date format
HIST_STAMPS="dd/mm/yyyy"

# ---------------------------------------------- #

# ZSH Setup

## Theme
ZSH_THEME="robbyrussell"

## Plugins
plugins=(git tmux golang)

## Options

### Update
zstyle ':omz:update' mode auto      # update automatically without asking

## tmux
if [ "$TMUX" = "" ]; then tmux; fi


## Autocompletion
### Kubectl autocomplete
autoload -Uz compinit
compinit
source <(kubectl completion zsh)

## Sourcing
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

## Aliases

# ---------------------------------------------- #
