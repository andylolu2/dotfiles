# Navigation
function ..
    cd ..
end
function ...
    cd ../..
end
function ....
    cd ../../..
end
function .....
    cd ../../../..
end

# Utilities
function grep
    command grep --color=auto $argv
end

abbr -a clip "xclip -sel clipboard"
abbr -a vim nvim
abbr -a mkdir "mkdir -pv"
abbr -a safe_rm "rm -iv"

# find/read files
abbr -a h head
abbr -a t tail
abbr -a fd "find . -type d -name"
abbr -a ff "find . -type f -name"

# tree
abbr -a tree "tree -C"
abbr -a treel "tree -C -L"

# git
abbr -a g git
abbr -a gst git status
abbr -a ga git add
abbr -a gc git commit
abbr -a gca git commit --amend --no-edit
abbr -a gp git push
abbr -a gpf git push -f

# tmux
abbr -a ta "tmux attach -d -t"
abbr -a td "tmux detach"
abbr -a tn "tmux new -A -D -s"
abbr -a tl "tmux ls"
abbr -a tkill "tmux kill-server"
abbr -a tdel "tmux kill-session -t"
