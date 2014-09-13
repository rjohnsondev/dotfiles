# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme rjohnson

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins vi-mode python autojump

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish
#
alias leaddb="mysql -uleadgen -h54.195.186.183 leadgen"
alias alfred="mysql -urichard -halfred.skimlinks.com -p mugic"
alias batman="mysql -urichard -hbatman.skimlinks.com -p mugic"

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

set fish_greeting ""

. ~/virtualfish/virtual.fish
. ~/virtualfish/auto_activation.fish
