
# update paths
set -x PATH /usr/local/bin /usr/local/go/bin ~/.cabal/bin ~/bin $PATH

# use vi mode
function fish_user_key_bindings
  fish_vi_key_bindings
end
