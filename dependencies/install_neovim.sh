#!/bin/bash
 
# Script for installing neovim without root access.
# It will be installed in $HOME/.local
 
# exit on error
set -e

VERSION=0.9.5
BUILD_TEMP_DIR=/tmp/nvim
LOCAL_DIR=$HOME/.local

mkdir -p $LOCAL_DIR $BUILD_TEMP_DIR
cd $BUILD_TEMP_DIR

wget https://github.com/neovim/neovim/releases/download/v$VERSION/nvim-linux64.tar.gz
tar xf nvim-linux64.tar.gz

cp nvim-linux64/bin/nvim $LOCAL_DIR/bin
