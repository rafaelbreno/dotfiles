# Terminal Setup

## Env variables

## Builds
export ZIG_PATH="$HOME/github.com/ziglang/zig/build/stage3/bin"
export ZLS_PATH="$HOME/github.com/zigtools/zls/zig-out/bin"

### XDG Home
export XDG_CONFIG_HOME="$HOME/github.com/rafaelbreno/dotfiles"

## LLVM
export PATH="/opt/llvm/bin:$PATH"
export MANPATH="/opt/llvm/share/man:$MANPATH"

### Languages
NPM_PACKAGES="$HOME/.npm_packages"
YARN_BIN_PATH="$HOME/.yarn/bin"
export PATH="$PATH:$HOME/.dotnet/tools"
export GOPATH=$HOME/go

### Path
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/bin"
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$XDG_CONFIG_HOME/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/go/bin
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
export DOCKER_CLIENT_TIMEOUT=240
export COMPOSE_HTTP_TIMEOUT=240
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.bun/bin"
export PATH="$PATH:$ZIG_PATH"
export PATH="$PATH:$ZLS_PATH"
export PATH="$PATH:$YARN_BIN_PATH"

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
plugins=(git tmux golang docker docker-compose zig-shell-completions rust)

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
#. $HOME/.asdf/asdf.sh

## Aliases
### Langs

## Neofetch
alias nf='neofetch --config $HOME/.files/neofetch/config.conf'
alias bun='$HOME/.bun/bin/bun'

# ---------------------------------------------- #
