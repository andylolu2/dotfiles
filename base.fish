set -Ux EDITOR nvim
set -Ux VISUAL $EDITOR

set -Ux DOTFILES ~/.dotfiles
set -Ux PROJECTS ~/Projects

fish_add_path -a $HOME/.bin $HOME/.local/bin

for f in $DOTFILES/*/functions
    # add /function dirs to fish_function_path if not already there
    if not contains $f $fish_function_path
        set -Up fish_function_path $f
    end
end

for f in $DOTFILES/*/conf.d/*.fish
    # symlink all conf.d files to ~/.config/fish/conf.d
    ln -sf $f $__fish_config_dir/conf.d/(basename $f)
end

if test -f ~/.localrc.fish
    ln -sf ~/.localrc.fish $__fish_config_dir/conf.d/localrc.fish
end
