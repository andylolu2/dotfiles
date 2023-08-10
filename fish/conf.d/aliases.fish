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

abbr -a clip "xclip sel clipboard"
abbr -a vim nvim
abbr -a g git
abbr -a mkdir "mkdir -p"

# find/read files
abbr -a h head
abbr -a t tail
abbr -a fd "find . -type d -name"
abbr -a ff "find . -type f -name"

# tree
abbr -a tree "tree -C"
abbr -a treel "tree -C -L"
