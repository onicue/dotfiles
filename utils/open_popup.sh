SESSION_NAME=$(tmux show-option -gqv @popup_name)

tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $SESSION_NAME
fi

tmux set-option -t $SESSION_NAME: status "off"

tmux attach-session -t $SESSION_NAME
