# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/bin"

# Language Support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# NVIM init.vim path
export XDG_CONFIG_HOME="$HOME/.config/dotfiles/"

# Path to your oh-my-zsh installation.
export MYVIMRC="$HOME/.config/dotfiles/nvim/init.vim"

# Kubectl autocomplete
#autoload -Uz compinit
#compinit
#source <(kubectl completion zsh)


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $HOME/.oh-my-zsh/oh-my-zsh.sh

export GOPATH=$HOME/go
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/go/bin
NPM_PACKAGES="${HOME}"/.npm-packages
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
export DOCKER_CLIENT_TIMEOUT=240
export COMPOSE_HTTP_TIMEOUT=240
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/.asdf/installs/php/*/.composer/vendor/bin/"

NPM_PACKAGES="~/.npm_packages"

export PATH="$PATH:$NPM_PACKAGES/bin"
