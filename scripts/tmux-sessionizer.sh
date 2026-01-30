#!/bin/bash

create_session() {
  selected=$(find ~/Documents ~/projects ~/ ~/work ~/personal -mindepth 1 -maxdepth 1 -type d | fzf --reverse)

  if [[ -z $selected ]]; then
    exit 0
  fi

  selected_name=$(basename "$selected" | tr . _)
  tmux_running=$(pgrep tmux)

  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
  fi

  if ! tmux has-session -t=$selected_name 2>/dev/null; then
    tmux new-session -ds $selected_name -c $selected
  fi

  tmux switch-client -t $selected_name
}

move_to_session() {
  session=$(tmux list-sessions | sed -E 's/:.*$//' | grep -v "$(tmux display-message -p '#S')" | fzf --reverse)
  tmux move-window -t $session
  tmux switch-client -t $session
}

create_ssh_session() {
  remote_host=$(grep "Host " "$HOME/.ssh/config" | grep -v "github.com" | awk '{ print $2 }' | fzf --reverse)
  tmux new-window "ssh $remote_host"
}

if [ "$1" == "--create" ] || [ "$1" == "-c" ]; then
  create_session
elif [ "$1" == "--move" ] || [ "$1" == "-m" ]; then
  move_to_session
elif [ "$1" == "--ssh" ]; then
  create_ssh_session
fi
