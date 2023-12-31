#! /usr/bin/bash 
source /etc/profile
clear

echo "
This NEOVIM is heavily inspired by ThePrimeagen. I Yanked it and made it mine !!!!!!!!!! I made a  couple of changes and made it in a script form for those who want ."
sleep 3  

 echo""
 echo""
 echo""
 echo""

echo " This is only for ARCH Users"

echo""
echo""
echo " -  Installing clang and its a c++ environment . You can install your environment"
sleep 3  
echo""
echo""
echo "You can create your own LSP . Please read the LSP section on my github about it"
sleep 3 
 sudo pacman -Sy clang


 sudo pacman -Syu 

 sudo pacman -Sy nodejs
 sudo pacman -Sy ripgrep
 echo ""
 echo ""

if [ ! -d ~/.config/nvim ]; then
  mkdir ~/.config/nvim/
fi

cd ~/.config/nvim/

if [ ! -d ~/.config/nvim/nvim-packer-git/ ]; then
  cd ~/.config/nvim/ && git clone https://aur.archlinux.org/nvim-packer-git.git || { echo "Failed to clone Packer."; exit 1; }
  cd nvim-packer-git/
  makepkg -si
fi
sudo pacman -U nvim-packer-git-r574.ea0cc3c-1-any.pkg.tar.zst

cd
cd ~/.config/nvim/

git clone https://github.com/altaffff/Nvim-Ide.git

cd

cd ~/.config/nvim/Nvim-Ide/ 
cp -r after ~/.config/nvim
cp -r init.lua ~/.config/nvim
cp -r lua/ ~/.config/nvim/
