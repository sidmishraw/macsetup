#!/bin/bash
# Author: Sidharth Mishra <sidmishraw@gmail.com>
# Description sets up the enviroment variables needed for java jdk


# check the invoking shell is bash, if not abort since fish has incompatibility
# issues.
invoking_shell="$(ps -o comm= $PPID)";

if [ $? -gt 0 ]
then
	echo "Executing from an incompatible shell, please use bash shell to source this script";
	echo "Aborting...";
	exit 1;
fi

echo "Invoking command/shell = ${invoking_shell}";

if ! [ "${invoking_shell}" = "login" ]
then
	echo "Not sourcing the file, Aborting...";
	echo "Usage source java_env_setup.sh";
	exit 1;
fi

# Set up java home
JAVAC_PATH="$(ls -ali /usr/bin/javac | cut -d ' ' -f 16)";
JAVA_HOME="$(echo $JAVAC_PATH | cut -d '/' -f 1-7)";

echo "Found and exported JAVAC_PATH=$JAVAC_PATH";
echo "Found and exported JAVA_HOME=$JAVA_HOME";
