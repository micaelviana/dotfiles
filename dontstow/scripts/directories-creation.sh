#!/usr/bin/env bash

#create programming folder
[ ! -d $HOME/Developer ] && mkdir -p $HOME/Developer/{poc,projects,remote} 
echo "developer folder is ready"

#create folder to download binaries
[ ! -d $HOME/.local/bin ] && mkdir -p $HOME/.local/bin 
echo "local/bin folder is ready"

#create config folder
[ ! -d $HOME/.config ] && mkdir -p $HOME/.config
echo "config folder is ready" 
