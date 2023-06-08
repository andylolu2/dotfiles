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

alias clip "xclip -selection clipboard"
alias vim nvim
alias g git
alias mkdir "mkdir -p"

# find/read files
alias h head
alias t tail
alias fd "find . -type d -name"
alias ff "find . -type f -name"

# tree
alias tree="tree -C"
alias treel="tree -C -L"
