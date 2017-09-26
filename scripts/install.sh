#!/bin/sh
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

echo "Begining install..."
if [ $(uname) != "Linux" ]; then
    echo "OS is not Linux... bailing out"
    exit 1
fi

echo "Running on $(lsb_release -a)"

echo "Copying files..."
mkdir -p  ~/.config/systemd/user
cp ./config/systemd/user/profile-offload.service ~/.config/systemd/user
mkdir -p ~/.local/share/
cp ./local/share/profdiv.sh ~/.local/share

if [ -d "./bin" ]; then 
echo "Copying binaries..."
    if [ ! -d ~/bin ]; then
        mkdir ~/bin
    fi
    cp -r ./bin/* ~/bin/
fi

echo "Enabling and starting service"
systemctl --user enable profile-offload
systemctl --user start profile-offload

echo "Done!"