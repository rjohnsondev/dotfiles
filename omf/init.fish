
# update paths
set -x PATH /usr/local/bin ~/bin ~/apache-maven-3.3.9/bin /home/richard/gcloud/google-cloud-sdk/bin ~/.rbenv/bin /usr/local/go/bin $PATH

# use vi mode
function fish_user_key_bindings
  fish_vi_key_bindings
end

# set -x NVM_DIR ~/.nvm
# source ~/.config/fish/nvm-wrapper/nvm.fish

eval (python -m virtualfish)

alias vim "nvim"
complete --command gcloud --arguments="(/home/richard/gcloud/google-cloud-sdk/autocomplete.py (commandline -cp))"

status --is-interactive; and . (rbenv init -|psub)

# bass source '/home/richard/gcloud/google-cloud-sdk/path.bash.inc'
# bass source '/home/richard/gcloud/google-cloud-sdk/completion.bash.inc'
eval (python -m virtualfish)
