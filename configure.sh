#!/bin/sh

sudo apt install tmux vim vim-gtk batcat xclip git

# configure git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"

CUR_PATH=$(pwd)
echo $CUR_PATH

mkdir ~/bin
#script to create tmux session based on the current directory name
ln -sfv ${CUR_PATH}/bin/tat ~/bin/tat
# update user's .bashrc with tmux and vim integration commands
cat .bashrc_update >> ~/.bashrc
source ~/.bashrc

ln -sfv ${CUR_PATH}/.tmux.conf ~/.tmux.conf

# Vim configuration
ln -sfv ${CUR_PATH}/.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
