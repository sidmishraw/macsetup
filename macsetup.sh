#!/bin/bash
# Author: Sidharth Mishra<sidmishraw@gmail.com>
# Description: Setup script for setting up macbook from scratch with all the
# developer tools needed

message="";

handle_error() {
  if [ "$1" -gt 0 ]
  then
    echo "ERROR:: $2";
    echo "Aborting...";
    exit 1;
  fi
}

# Install Xcode command line tools -- this is needed by most of the tools
xcode-select -p
if [ $? -gt 0 ]
then
  echo "xcode-select tools are not installed, Installing...";
  xcode-select --install;
  handle_error $? "xcode-select install failed";
else
  echo "xcode-tools are installed, moving on..";
fi

# agree to license for xcode
sudo xcodebuild -license
handle_error $? "Licensing of xcode failed"

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
handle_error $? "Homebrew install failed, retry manually";

# Install brew basics -- as recommend by Kenneth Reitz
brew install terminal-notifier;
handle_error $? "terminal-notifier install failed";

brew tap domt4/autoupdate;
handle_error $? "brew tapping of dom4/autoupdate failed";

brew autoupdate --start --upgrade --cleanup --enable-notifications;
handle_error $? "brew autoupdate failed";

# Install brew essentials
brew install heroku;
handle_error $? "failed to install heroku";

brew install git;
handle_error $? "failed to install git";

brew install ack;
handle_error $? "failed to install ack";

# Install download utilities
brew install youtube-dl;
handle_error $? "failed to install youtube-dl";

brew install wget;
handle_error $? "failed to install wget";

brew install httpie;
handle_error $? "failed to install httpie";

# Install fish shell
brew install fish;
handle_error $? "failed to install fish";

# command line google
brew install googler;
handle_error $? "failed to install googler";

# Install bash utilities
brew install bats;
handle_error $? "failed to install bats";

brew install shellcheck;
handle_error $? "failed to install spellcheck";

# Install python
brew install python2;
handle_error $? "failed to install python2";

brew install python3;
handle_error $? "failed to install python3";

brew install pyenv;
handle_error $? "failed to install pyenv";

brew install pypy;
handle_error $? "failed to install pypy";

brew install pypy3;
handle_error $? "failed to install pypy3";

brew install ipython;
handle_error $? "failed to install ipython";

# Install pipsi
pip2 install pipsi;
handle_error $? "failed to install pipsi";

# Install pipenv
pipsi install pew;
handle_error $? "failed to install pew";

pipsi install pipenv;
handle_error $? "failed to install pipenv";

# Install git utilities
brew install git-open;
handle_error $? "failed to install git-open";

brew install gist;
handle_error $? "failed to install gist";

pipsi install legit;
handle_error $? "failed to install legit";

# Install other languages --
brew install lua;
handle_error $? "failed to install lua";

brew install node;
handle_error $? "failed to install node";

brew install ruby;
handle_error $? "failed to install ruby";

brew install go;
handle_error $? "failed to install go";

brew install rust;
handle_error $? "failed to install rust";


# Install latest Vim
brew install vim;
handle_error $? "failed to install vim";

# TODO:: Install java, eclipse, vscode

# Check if workspace directory is created, if not create them else do nothing
if [ -d "workspace" ]
then
  echo "workspace exists, doing nothing";
else
  echo "workspace doesn't exist, creating workspace directory";
  mkdir workspace;
  handle_error $? "failed to create workspace directory";
fi
