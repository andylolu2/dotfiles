#!/usr/bin/env fish
if not command -qs nvim
    exit
end

abbr -a vim nvim

if command -qs cargo
    cargo install tree-sitter-cli &>/dev/null
end

# update plugins
nvim --headless "+Lazy! sync" +qa &>/dev/null

# install node
nvm install lts &>/dev/null
set --universal nvm_default_version lts
