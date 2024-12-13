#!/bin/bash

inputrc_path=~/.config/inputrc

# If ~/.inputrc doesn't exist yet: First include the original /etc/inputrc
# so it won't get overriden
if [ -f ~/.inputrc ]; then
    mv ~/.inputrc ${inputrc_path}
elif [ ! -f $inputrc_path ]; then
    echo '$include /etc/inputrc' > $inputrc_path
fi

# Add shell-option to enable case-insensitive tab completion
echo 'set completion-ignore-case On' >> $inputrc_path

# Add export
echo "export INPUTRC=${inputrc_path}" >> ~/.bashrc.d/local.sh

unset inputrc_path

