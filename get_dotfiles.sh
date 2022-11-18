#!/bin/bash

if ! command -v git &> /dev/null; then
  echo 'git not found'
  exit
fi

if [ -d ~/.dotfiles ]; then
  cd ~/.dotfiles
  git pull
else
  git clone https://github.com/csgeorges/dotfiles.git ~/.dotfiles
fi

cd ~/.dotfiles/home
for i in `ls -A`; do
  if [ -e ~/$i ]; then
    rm -rf ~/$i
  fi
  ln -s ~/.dotfiles/home/$i ~/$i
done
touch ~/.sudo_as_admin_successful
source ~/.bashrc
