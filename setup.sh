#!/bin/bash

script_dir=$(dirname "$0")

if [ ! -d "~/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  git -C ~/.oh-my-zsh pull
fi

asdf_version="v0.14.1"

if [ ! -d "~/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $asdf_version
else
  git -C ~/.asdf checkout $asdf_version
fi

if [ ! -f "~/.gitconfig" ]; then
  cp "$script_dir/gitconfig" ~/.gitconfig
fi

if [ ! -f "~/.vimrc" ]; then
  cp "$script_dir/vimrc" ~/.vimrc
fi

source_this_file="$script_dir/zshrc"
zshrc_file=~/.zshrc

if ! grep -Fxq "$source_this_file" "$zshrc_file"; then
  echo "$source_this_file" >> "$zshrc_file"
fi

source ~/.zshrc
