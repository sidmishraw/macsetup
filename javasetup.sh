#!/bin/bash
# Author: Sidharth Mishra <sidmishraw@gmail.com>
# Description: Installs java using homebrew and all necessary essentials

handle_error(){
	if [ "$1" -gt 0 ]
	then
		echo "ERROR:: $2";
		echo "Aborting...";
		exit 1;
	fi
}

# Install java from homebrew
# This will install latest stable version of Java
brew update;
brew tap caskroom/cask;
brew install caskroom/cask/java;
handle_error $? "Failed to install java from caskroom/cask. Try manually";

# The setup of environment variables is done by the java_env_setup.sh
