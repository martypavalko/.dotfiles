#!/bin/bash
CACHE_FILE="$HOME/.cache/tmux-todo-file"
TODO_DIR="$HOME/todo"

# -p (pick): fuzzy select a file and save it
# -b (banner): read saved file and display counts

pick_todo() {
  selected=$(find "$TODO_DIR" -type f | fzf --reverse)
  [ -n "$selected" ] && echo "$selected" >"$CACHE_FILE"
}

display_banner() {
  [ ! -f "$CACHE_FILE" ] && echo "no todo" && exit 0
  file=$(cat "$CACHE_FILE")
  [ ! -f "$file" ] && echo "todo file empty" && exit 0
  completed=$(grep -c "^\- \[x\]" "$file")
  incomplete=$(grep -c "^\- \[ \]" "$file")
  echo "󰄱 $incomplete  $completed"
}

case "$1" in
-p | --pick) pick_todo ;;
-b | --banner) display_banner ;;
esac
