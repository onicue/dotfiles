SESSION_NAME=$(tmux display-message -p "#{session_name}")

if [ "$SESSION_NAME" = $(tmux show-option -gqv @popup_name) ]; then
  tmux set-option -t $SESSION_NAME: status "on"
fi
