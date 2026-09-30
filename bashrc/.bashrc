if command -v mise &>/dev/null; then
  eval "$(mise activate bash)"
fi

if [[ $- == *i* ]] && [[ ${TERM:-} != "dumb" ]] && command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
fi

if command -v bat &>/dev/null; then
  alias cat="bat -p --paging=never"
  alias less="bat -p"
fi

if command -v eza &>/dev/null; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='ls -a'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='lt -a'
fi

if command -v zoxide &>/dev/null; then
  alias cd="zd"
  zd() {
    if (($# == 0)); then
      builtin cd ~ || return
    elif [[ -d $1 ]]; then
      builtin cd "$1" || return
    else
      if ! z "$@"; then
        echo "Error: Directory not found"
        return 1
      fi

      printf "\U000F17A9 "
      pwd
    fi
  }
fi

if command -v kubectx &>/dev/null && command -v kubens &>/dev/null; then
  alias kc=kubectx
  alias kn=kubens
fi

if command -v kubectl &>/dev/null; then
  alias k=kubectl
  alias kg="kubectl get"
fi

aws_profile_picker() {
  if [[ -z $TMUX ]]; then
    export AWS_PROFILE=$(rg '^\[profile (.+)\]' ~/.aws/config --replace '$1' --no-filename | fzf --reverse)
  else
    local tmpfile=$(mktemp)
    tmux display-popup -E "rg '^\[profile (.+)\]' ~/.aws/config --replace '\$1' --no-filename | fzf --reverse > $tmpfile"
    local selected_profile=$(cat "$tmpfile")
    rm -f "$tmpfile"
    if [[ -n $selected_profile ]]; then
      export AWS_PROFILE=$selected_profile
    fi
  fi
}

alias ap=aws_profile_picker
