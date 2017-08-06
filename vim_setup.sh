#!/bin/bash
#
# Author: Sidharth Mishra <sidmishraw@gmail.com>
#
# Description: This script sets up the vim editor with all the necessary packages


# vundle repo link
VUNDLE_REPO_URL="https://github.com/VundleVim/Vundle.vim.git";

# Sid's vimrc repo, download this file and rename it to .vimrc to be used by vim editor
VIMRC_REPO_URL="https://raw.githubusercontent.com/sidmishraw/myvim/master/vimrc";

# check if git is installed
which git;

if [ $? -gt 0 ]
then
	echo "git is not installed, Aborting...";
	exit 1;
fi

# check if HOME enviroment variable is set
if ! [ -d "$HOME" ]
then
	echo "FATAL ERROR:: HOME enviroment variable is not set";
	echo "Aborting";
	exit 1;
fi


# utility function for installing Vundle vim package manager if it is not installed
install_vundle() {
	# check if bundle/Vundle.vim is present
        if [ [ -d "$HOME/.vim/bundle/Vundle.vim" ] -o [ -f "$HOME/.vim/bundle/Vundle.vim" ] ]
        then
                echo "Vundle present, moving on";
        else
                echo "Vundle not present, cloing from the repository";
                echo "Vundle git repo url = ${VUNDLE_REPO_URL}";

                git clone "${VUNDLE_REPO_URL}" "$HOME/.vim/bundle/Vundle.vim";

                if [ $? -gt 0 ]
                then
                        echo "git cloning of Vundle.vim failed, retry again";
                        echo "Aborting...";
                        exit 1;
                fi
        fi
}


# check if .vim directory is present
if [ -d "$HOME/.vim" ]
then
	echo "$HOME/.vim is present, checking if bundles are installed...";
	install_vundle;
else
	echo "$HOME/.vim is not present, creating directory";
	mkdir "$HOME/.vim";
	install_vundle;
fi


# download Sid's vimrc file and move it into HOME and rename it to .vimrc
wget "${VIMRC_REPO_URL}";

if [ $? -gt 0 ]
then
	echo "Failed to download the vimrc file, Aborting...";
	exit 1;
fi

mv "vimrc" "${HOME}/.vimrc";

if [ $? -g 0 ]
then
	echo "failed to move vimrc to $HOME/.vimrc, do it manually";
else
	echo "$HOME/.vimrc is ready";
	echo "Launch vim and run :PluginInstall
	To install from command line: vim +PluginInstall +qall";
fi

# install cmake with homebrew if it is not installed
which cmake;

if [ $? -gt 0 ]
then
  echo "installing cmake from homebrew repo";
  brew install cmake;
fi


# After cmake has been installed, ask to install YouCompleteMe using
# HOME/.vim/bundle/YouCompleteMe/install.py
echo "Install YouCompleteMe after PluginInstall by using install.py";
