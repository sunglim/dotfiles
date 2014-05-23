#!/bin/bash
CUR_DIR=`pwd`
cd $HOME

#
# Screen RC
#
if [ -f .screenrc ]; then
  echo 'Move Old .screenrc to screenrc.old'
  mv .screenrc screenrc.old
fi

echo 'Copy .screenrc to ROOT'
cp $CUR_DIR/.screenrc $HOME/.screenrc

#
# VI setup
#
if [ -f .vimrc ]; then
  echo 'Move Old .vimrc to vimrc.old'
  mv .vimrc vimrc.old
fi

echo 'Copy .vimrc to ROOT'
cp $CUR_DIR/vim/.vimrc $HOME/.vimrc

echo 'clone vundle.. '
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo 'Install plugins declared at Bundle'
vim +BundleInstall +qall

#
# Utility script.
#
echo 'Copy ./util/* to ROOT'
cp $CUR_DIR/util/ $HOME -R

