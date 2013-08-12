#!/bin/bash
CUR_DIR=`pwd`
cd $HOME
if [ -f .screenrc ]; then
  echo 'Move Old .screenrc to screenrc.old'
  mv .screenrc screenrc.old
fi

echo 'Copy .screenrc to ROOT'
cp $CUR_DIR/.screenrc $HOME/.screenrc

if [ -f .vimrc ]; then
  echo 'Move Old .vimrc to vimrc.old'
  mv .vimrc vimrc.old
fi

echo 'Copy .vimrc to ROOT'
cp $CUR_DIR/.vimrc $HOME/.vimrc

echo 'clone vundle.. '
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo 'Install plugins declared at Bundle'
vim +BundleInstall +qall
