#!/usr/bin/env fish
if ! command -qs tmux
    exit
end

test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

alias --save ta "tmux attach -d -t"
alias --save td "tmux detach"
alias --save tn "tmux new -A -D -s"
alias --save tl "tmux ls"
alias --save tkill "tmux kill-server"
alias --save tdel "tmux kill-session -t"
