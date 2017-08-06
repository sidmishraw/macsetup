# MAC OSX enviroment setup

This repository contains scripts for setting up the mac osx environment I use for my uses.

The scripts and their functionalities are as follows:

* `macsetup.sh`: It is the initial script that installs most of the components and makes a `workspace` directory at the end in the invoked location.
For best results do the following:
```bash
wget <github url to the raw macsetup.sh file>
```
Execute the above from your ~/Documents or desired directory and then make the file executable.
Execute the script `./macsetup.sh`

* `javasetup.sh`: It is used to setup java on the mac. Java is installed through Homebrew.

* `java_env_setup.sh`: It is the script which needs to be sourced for setting environment variables like `JAVA_HOME`.

* `vim_setup.sh`: This script downloads and sets up the vim plugins needed to make working with the VIM
  editor hassle free.
