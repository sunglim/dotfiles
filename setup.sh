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
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo 'Install plugins declared at Bundle'
vim +PluginInstall +qall

#
# Utility script.
#
echo 'Copy ./util/* to ROOT'
cp $CUR_DIR/util/ $HOME -R

#
# Ben's profile, It has short cuts and nice PS1.
#
echo "source $CUR_DIR/ben_profile/git_completion" >> ~/.bashrc
echo "source $CUR_DIR/ben_profile/profile" >> ~/.bashrc
echo "export PATH=$PATH:$CUR_DIR/scripts" >> ~/.bashrc
