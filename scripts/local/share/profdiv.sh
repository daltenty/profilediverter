#!/bin/bash
# Profile Diverter - SystemD service to move large files out of the users homedir 
# Copyright (C) 2017 David Tenty

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
REDIR_NAME=profdiv-$USER
REDIR_PATH=$HOME/.local/share/JetBrains/Toolbox/apps
mkdir -p $REDIR_PATH
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
