#!/bin/bash

# Ask Y/n
function ask() {
    read -p "$1 (Y/n): " resp
    if [ -z "$resp" ]; then
        response_lc="y" # empty is Yes
    else
        response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    [ "$response_lc" = "y" ]
}

# Replace .bashrc
ln -sb --suffix=.old $(realpath config/bashrc) ~/.bashrc

# create .bashrc.d
mkdir ~/.bashrc.d

echo '# -------------- dotfiles install ---------------'

# Ask which files should be sourced
echo "Do you want to source:"
for file in shell/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        if ask "${filename}?"; then
            ln -s $(realpath "$file") ~/.bashrc.d/$filename
        fi
    fi
done

echo '# -------------- dotfiles install ---------------'

echo "Do you want to install config:"
for file in install.d/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        if ask "${filename}?"; then
            . $file
        fi
    fi
done
