#!/bin/bash

jump_to_session() {
    tmux list-sessions | sed -E 's/:.*$//' | grep -v "^$(tmux display-message -p '#S')\$" | grep -v "scratch" | fzf --reverse | xargs tmux switch-client -t
}

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
    tmux new-window -n "$remote_host" "TERM=screen ssh $remote_host"
}

manage_popout_session() {
    # Want to create one session for scratch and one for todo
    # These sessions should not show up for the other functions of sessionizer
    # unless, a flag like '--all' is passed or something like that
    # The idea is to be able to create a floating tmux window to quickly view
    # todos or jot something down
    # todo_path="$HOME/Documents/PKM"
    width=${2:-40%}
    height=${2:-60%}
    if [ "$(tmux display-message -p -F "#{session_name}")" = "scratch" ]; then
        tmux detach-client
    else
        tmux display-popup -d "#{pane_current_path}" -x200 -y-100 -w"$width" -h"$height" -E "tmux attach -t scratch || tmux new -s scratch"
    fi
}

if [ "$1" == "--create" ] || [ "$1" == "-c" ]; then
    create_session
elif [ "$1" == "--move" ] || [ "$1" == "-m" ]; then
    move_to_session
elif [ "$1" == "--ssh" ]; then
    create_ssh_session
elif [ "$1" == "--scratch" ]; then
    manage_popout_session
elif [ "$1" == "--jump" ] || [ "$1" == "-j" ]; then
    jump_to_session
fi
