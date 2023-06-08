#!/usr/bin/env fish
set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings

string join \n 1 2 2 2 3 2 1 y | tide configure
