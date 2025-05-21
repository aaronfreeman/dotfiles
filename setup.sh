#!/bin/zsh

script_dir=$(dirname "$0")
script_dir=$(cd "$script_dir" && pwd)

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "You need to install Oh My ZSH first by running:"
  echo 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
  exit
else
  git -C ~/.oh-my-zsh pull > /dev/null 2>&1
fi

asdf_version="v0.14.1"

if [ ! -d "$HOME/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch $asdf_version
else
  git -C ~/.asdf checkout $asdf_version > /dev/null 2>&1
fi

if [ ! -f "$HOME/.gitconfig" ]; then
  cp "$script_dir/gitconfig" "$HOME/.gitconfig"
fi

if [ ! -f "$HOME/.vimrc" ]; then
  ln -s "$script_dir/vimrc" "$HOME/.vimrc"
fi

zshrc_file="$HOME/.zshrc"

# Comment out plugins since it's in zshrc
sed -i '' 's/^plugins/# &/' "$zshrc_file"

command_to_insert="source $script_dir/zshrc"

if ! grep -Fxq "$command_to_insert" "$zshrc_file"; then
sed -i '' '/source \$ZSH\/oh-my-zsh.sh/i\
source /Users/aaron/Projects/dotfiles/zshrc
' "$zshrc_file"
fi

source $HOME/.zshrc