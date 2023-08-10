#!/usr/bin/env fish
if ! command -qs tmux
    exit
end

test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

abbr -a ta "tmux attach -d -t"
abbr -a td "tmux detach"
abbr -a tn "tmux new -A -D -s"
abbr -a tl "tmux ls"
abbr -a tkill "tmux kill-server"
abbr -a tdel "tmux kill-session -t"
