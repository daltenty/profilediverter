#!/bin/bash
REDIR_NAME=jetb-$USER
REDIR_PATH=$HOME/.local/share/JetBrains/Toolbox/apps
mkdir $REDIR_PATH
if [ ! -L $REDIR_PATH ]; then
	echo "Moving jetb toolbox app dir"
	mv $REDIR_PATH /tmp/$REDIR_NAME
	ln -s /tmp/$REDIR_NAME $REDIR_PATH
else
	echo "Already moved, making sure local dir exists"
	if [ ! -e /tmp/$REDIR_NAME ]; then
		echo "Making local dir"	
		mkdir /tmp/$REDIR_NAME
	fi
fi
