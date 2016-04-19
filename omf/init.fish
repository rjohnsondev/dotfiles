
# update paths
set -x PATH /usr/local/bin /usr/local/go/bin ~/.cabal/bin ~/bin ~/apache-maven-3.3.9/bin $PATH

# use vi mode
function fish_user_key_bindings
  fish_vi_key_bindings
end

set -x NVM_DIR ~/.nvm
source ~/.config/fish/nvm-wrapper/nvm.fish
