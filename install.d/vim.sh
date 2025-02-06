#!/bin/bash

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p "$CONFIG_DIR/vim"
ln -s $(realpath config/vimrc) "$CONFIG_DIR/vim/vimrc"
