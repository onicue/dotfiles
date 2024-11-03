set NIX_LINK "$HOME/.nix-profile"
set -g fish_greeting
fish_vi_key_bindings
bind yy fish_clipboard_copy
bind Y fish_clipboard_copy
bind p fish_clipboard_paste

if status is-interactive
    # Commands to run in interactive sessions can go here
end
