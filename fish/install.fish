#!/usr/bin/env fish
set -U fish_greeting

fish_vi_key_bindings

string join \n 1 2 2 2 3 2 1 y | tide configure
