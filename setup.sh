#!/bin/bash

# Delete all desktop.ini files
find . -name "desktop.ini" -type f -exec rm {} +

# Create Folders and copy config
# NVIM
echo "1) Copying nvim config..."
mkdir -p ~/.config/nvim
# cp ./init.lua ~/.config/nvim/init.lua
cp -r ./nvim/* ~/.config/nvim
sleep 1

# TMUX
echo -e "\n-----------------------"
echo "2) Copying tmux.conf"
cp ./.tmux.conf ~/.tmux.conf
sleep 1

# BASHRC
echo -e "\n-----------------------"
echo "3) Copying .bashrc"
cp ./.bashrc ~/.bashrc
source ~/.bashrc
sleep 1

# VIMRC
echo -e "\n-----------------------"
echo "4) Copying .vimrc"
cp ./.vimrc ~/.vimrc
sleep 1

# INSTALLATIONS
# NVIM
echo -e "\n-----------------------"
echo "5) Installing Neovim 10"
wget https://github.com/neovim/neovim-releases/releases/download/nightly/nvim-linux64.deb
echo -e "\n"
sudo dpkg -i nvim-linux64.deb
sleep 5
echo "   Removing .deb file."
rm *.deb

# RANGER
echo -e "\n-----------------------"
echo "6) Installing Ranger"
sudo apt install ranger -y
