#!/bin/bash
CUR_DIR=`pwd`
cd $HOME
if [ -f .screenrc ]; then
  echo 'Move Old .screenrc to screenrc.old'
  mv .screenrc screenrc.old
fi

echo 'Copy .screenrc to ROOT'
cp $CUR_DIR/.screenrc $HOME/.screenrc

echo 'clone vundle.. '
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo 'Install plugins declared at Bundle'
vim +BundleInstall +qall
