# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/
Theme 'rjohnson'
Plugin 'theme'
Plugin 'vi-mode'

set PATH /usr/local/bin ~/.cabal/bin $PATH
set PATH ~/bin $PATH
set PATH ~/go/bin $PATH
set -x GOROOT ~/go

eval (python -m virtualfish auto_activation)

set -gx RBENV_ROOT ~/.rbenv/bin
set PATH $RBENV_ROOT $PATH
. (rbenv init -|psub)
