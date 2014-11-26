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
alias leaddb="mysql -urichard -hleadsdb.skimlinks.com leadgen"
alias alfred="mysql -urichard -halfred.skimlinks.com -p mugic"
alias batman="mysql -urichard -hbatman.skimlinks.com -p mugic"
alias redshift="psql -Uwhmaster -p5439 -hwh.clb7jg0ed4iz.us-east-1.redshift.amazonaws.com -dwh"

function lp
    set c 'lpass ls | '
    for x in $argv
        set c "$c grep -i '$x' | "
    end
    set c "$c sed -n 's/.*\[id: \([0-9]*\)\].*/\1/p'"
    set vals (eval $c)
    for v in $vals
        lpass show $v
    end
end

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

set fish_greeting ""

. ~/virtualfish/virtual.fish
. ~/virtualfish/auto_activation.fish

set PATH ~/.rbenv/bin $PATH
set PATH ~/bin $PATH
set PATH /home/richard/adt-bundle-linux-x86_64-20140702/sdk/tools $PATH
set PATH /home/richard/adt-bundle-linux-x86_64-20140702/sdk/platform-tools $PATH
set PATH ~/apache-maven-3.2.3/bin $PATH
set PATH ~/go/bin $PATH
set -x GOROOT ~/go
set ANDROID_HOME /home/richard/adt-bundle-linux-x86_64-20140702/sdk
set -gx RBENV_ROOT ~/.rbenv
. (rbenv init -|psub)

test -s /home/richard/.nvm-fish/nvm.fish; and source /home/richard/.nvm-fish/nvm.fish
