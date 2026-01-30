if [ -z "$TODO_FILE" ]; then
  echo "\$TODO_FILE environment variable not set"
  exit 1
fi

if [ ! -f "$TODO_FILE" ]; then
  echo "File at path: $TODO_FILE does not exist"
  exit 1
fi

total_task_count=$(grep "^\- \[[x ]\]" $TODO_FILE | wc -l | tr -d " ")
completed_task_count=$(grep "^\- \[x\]" $TODO_FILE | wc -l | tr -d " ")
incomplete_task_count=$(grep "^\- \[ \]" $TODO_FILE | wc -l | tr -d " ")

# 󰄱
# 

display_banner() {
  echo "󰄱 $incomplete_task_count /  $completed_task_count"
}

if [ "$1" == "--banner" ] || [ "$1" == "-b" ]; then
  display_banner
fi

# DEBUG LINES
# echo "Total task count: $total_task_count"
# echo "Completed task count: $completed_task_count"
# echo "Incomplete task count: $incomplete_task_count"
