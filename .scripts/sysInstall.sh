#!/bin/sh

# Author: Pedro Moreira
# Purpose: My script for recover system after a clean install
# Date Created: 04/26/2019
# Date Modified: 04/26/2019

# Variables
## Generic
update=sudo apt-get update
upgrade=sudo apt-get upgrage
upgradeSy=sudo apt-get upgrade && sudo apt-get dist-upgrade
install=sudo apt-get install
installNR=sudo apt-get install --no-install-recommends
removePurge=sudo apt remove --purge

## Programs
systemCore=xorg xinit

systemTwm=i3-wm i3blocks rofi dunst libnotify-bin network-manager

systemSupport=xfce4-terminal thunar geany nitrogen redshift htop neofetch curl lm-sensors pavucontrol scrot xclip arandr

systemExtra=ttf-ubuntu-font-family mplayer ristretto xpdf ufw ubuntu-restricted-extras lxappearance xarchiver

systemDev=git zsh nodejs

npmInstallGlobal=sudo npm install -g gulp eslint now heroku  

systemPurge=ttf-mscorefonts-installer gnome-*

echo "--------- Instalando... ---------"
#Install
$update
$upgradeSy
$install $systemCore
$install $systemTwm
$install $systemSupport
$install $systemExtra

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

$install $systemDev

wget -O- https://telegram.org/dl/desktop/linux | sudo tar xJ -C /opt/
sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)
npm install spaceship-prompt

$npmInstallGlobal

$removePurge $systemPurge

echo "--------- Configurando... ---------"
# Config
git config --global user.name pponto
git config --global user.email pedromoreira@gmail.com
git config --global core.editor nano

cd
git clone https://github.com/pponto/my-backup
mv my-backup/* .
rm -rf .git

cd ~/.scripts/i3blocks
chmod +x *
cd ..
chmod +x morc_menu volume sysBackup.sh
cd

sudo mv xorg.conf /etc/X11/

sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw status

neofetch
echo "--------- Acabou Miseravi ---------"
