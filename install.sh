#!/bin/bash

function backupDir() {
  if [ -d $HOME/.$1 ]; then
    if [ -d $HOME/.$1.backup ]; then
      rm -rf $HOME/.$1.backup
    fi
    mv $HOME/.$1 $HOME/.$1.backup
  fi
}

function backupAndLink() {
  src=$1
  dest=$1
  
  if [ -f $HOME/.$dest ]; then
    if [ -f $HOME/.$dest.backup ]; then
      rm $HOME/.$dest.backup
    fi
    mv $HOME/.$dest $HOME/.$dest.backup
  fi

  ln -s $HOME/.files/$src $HOME/.$dest
}

backupDir 'antigen'
git clone https://github.com/zsh-users/antigen.git $HOME/.antigen

backupAndLink 'zshrc'
backupAndLink 'vimrc'
backupAndLink 'tmux.conf'
# backupAndLink 'ssh.conf' '.ssh/config'

backupDir 'vim'
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

zsh
