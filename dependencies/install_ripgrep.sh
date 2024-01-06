#!/bin/bash
 
# Script for installing ripgrep without root access.
# It will be installed in $HOME/.local
 
# exit on error
set -e

VERSION=14.0.3
BUILD_TEMP_DIR=/tmp/ripgrep
LOCAL_DIR=$HOME/.local

mkdir -p $LOCAL_DIR $BUILD_TEMP_DIR
cd $BUILD_TEMP_DIR

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/$VERSION/ripgrep-$VERSION-x86_64-unknown-linux-musl.tar.gz
tar xf ripgrep-$VERSION-x86_64-unknown-linux-musl.tar.gz
cp ripgrep-$VERSION-x86_64-unknown-linux-musl/rg $LOCAL_DIR/bin
