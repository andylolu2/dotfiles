#!/usr/bin/env fish
#
# bootstrap installs things.
# This file is based on 

set DOTFILES_ROOT $HOME/.dotfiles

function info
    echo [(set_color --bold) ' .. ' (set_color normal)] $argv
end

function user
    echo [(set_color --bold) ' ?? ' (set_color normal)] $argv
end

function success
    echo [(set_color --bold green) ' OK ' (set_color normal)] $argv
end

function abort
    echo [(set_color --bold yellow) ABRT (set_color normal)] $argv
    exit 1
end

function on_exit -p %self
    if not contains $argv[3] 0
        echo [(set_color --bold red) FAIL (set_color normal)] "Couldn't setup dotfiles, please open an issue at https://github.com/caarlos0/dotfiles"
    end
end


function link_file -d "links a file keeping a backup"
    echo $argv | read -l old new backup
    echo "linking $old to $new"
    if test -e $new
        set newf (readlink $new)
        if test "$newf" = "$old"
            success "skipped $old"
            return
        else
            mv $new $new.$backup
            and success moved $new to $new.$backup
            or abort "failed to backup $new to $new.$backup"
        end
    end
    mkdir -p (dirname $new)
    and ln -sf $old $new
    and success "linked $old to $new"
    or abort "could not link $old to $new"
end

function link_dotfiles
    for src in $DOTFILES_ROOT/*/*.symlink
        link_file $src $HOME/.(basename $src .symlink) backup
        or abort 'failed to link config file'
    end

    link_file $DOTFILES_ROOT/fish/plugins $__fish_config_dir/fish_plugins backup
    or abort plugins
    # link_file $DOTFILES_ROOT/ssh/config.dotfiles $HOME/.ssh/config.dotfiles backup
    # or abort ssh-config
    # link_file $DOTFILES_ROOT/ssh/rc $HOME/.ssh/rc backup
    # or abort ssh-rc
    link_file $DOTFILES_ROOT/nvim/config $HOME/.config/nvim backup
    or abort nvim
end

curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher
and success fisher
or abort fisher

# setup_gitconfig \
#     and success gitconfig or abort gitconfig

link_dotfiles
and success dotfiles
or abort dotfiles

fisher update
and success plugins
or abort plugins

mkdir -p $__fish_config_dir/completions/
and success completions
or abort completions

$DOTFILES_ROOT/base.fish
and success base.fish
or abort base.fish

for installer in $DOTFILES_ROOT/*/install.fish
    $installer
    and success $installer
    or abort $installer
end

if ! grep (command -v fish) /etc/shells
    command -v fish | tee -a /etc/shells
    and success 'added fish to /etc/shells'
    or abort 'setup /etc/shells'
    echo
end

test (which fish) = "$SHELL"
and success 'dotfiles installed/updated!'
and exit 0

chsh -s (which fish)
and success set (fish --version) as the default shell
or echo 'WARNING: Failed to set fish as default shell'

success 'dotfiles installed/updated!'
