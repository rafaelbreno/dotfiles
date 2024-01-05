# Terminal Setup

## Env variables

## Builds
export ZIG_PATH="$HOME/prog/zig/build/stage3/bin"
export ZLS_PATH="$HOME/prog/zls/zig-out/bin"

### XDG Home
export XDG_CONFIG_HOME="$HOME/.files"

### Languages
NPM_PACKAGES="$HOME/.npm_packages"
export GOPATH=$HOME/go

### Path
export PATH="$PATH:/usr/local/bin"
#export PATH="$PATH:$HOME/prog/zig/build/stage3/bin"
export PATH="$PATH:/usr/bin"
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/go/bin
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
export DOCKER_CLIENT_TIMEOUT=240
export COMPOSE_HTTP_TIMEOUT=240
#export PATH="$PATH:$HOME/prog/llvm-project-16/build-release/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.bun/bin"
export PATH="$PATH:$ZIG_PATH"
export PATH="$PATH:$ZLS_PATH"
#export PATH="$PATH:$HOME/local/llvm16-release/bin"

### Programming Langs
#### Rust
export PATH=$PATH:$HOME/.cargo/bin
export CARGO_NET_GIT_FETCH_WITH_CLI=true

### NVIM init.vim path
export MYVIMRC="$XDG_CONFIG_HOME/nvim/init.lua"

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
plugins=(git tmux golang docker docker-compose)

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
. $HOME/.asdf/asdf.sh

## Aliases
### Langs

## Neofetch
alias nf='neofetch --config $HOME/.files/neofetch/config.conf'
alias bun='$HOME/.bun/bin/bun'

# ---------------------------------------------- #
