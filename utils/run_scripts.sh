script_dir="$HOME/.config/tmux/scripts/"
current_dir=$(tmux display -p "#{pane_current_path}")

check_first_char(){
  local first_char="$1"
  first_char="${first_char:0:1}"
  if [[ "$first_char" == "_" ]]; then
    return 1
  else
    return 0
  fi
}

main(){
  declare -A file_map

  cd "$current_dir" || exit

  while ifs= read -r -d '' file; do
    if [[ -x "$file" ]]; then
      filename=$(basename "$file")

      new_filename="${filename%.*}"
      if ! check_first_char "$new_filename"; then
        new_filename="${new_filename:1}"
      fi

      new_filename=$(echo "$new_filename" | tr '_' ' ')

      file_map["$new_filename"]="$file"
    fi
  done < <(find "$script_dir" -maxdepth 1 -type f -print0)

  selected=$(printf '%s\n' "${!file_map[@]}" | fzf --layout=reverse --tmux)

  if [[ ! "$selected" ]]; then
    exit 0
  fi

  selected_file="${file_map[$selected]}"

  if [[ -n "$selected_file" ]]; then
    filename=$(basename "$selected_file")
    if ! check_first_char "$filename"; then
      tmux display-popup -E "bash -c 'cd "$current_dir" || exit; \"$selected_file\"'"
    else
      $selected_file
    fi
  fi
}

main
