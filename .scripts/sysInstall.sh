#!/bin.bash

# Author: Pedro Moreira
# Purpose: My script for recover system after a clean install
# Date Created: 9/6/2018
# Readme: Pls run in SUpercow mode
# Date Modified: 9/6/2018

# Variables
## Generic
update=apt-get update
upgrade=apt-get upgrage
upgradeSy=apt-get upgrade && apt-get dist-upgrade
install=apt-get install
installNR=apt-get install --no-install-recommends

## Programs
systemCore=openbox lightdm tint2?

systemSupport=pnmixer? nm-tray? xfce4-terminal?? pcmanfm geany nitrogen rofi dunst compton obconf obmenu htop neofetch libnotify-bin

systemExtra=firefox libre-office lm-sensors

systemDev=git npm nodejs zsh

##### faltam: polybar lxappearance?

$update
$upgradeSy
$install xorg -y
$installRN lightdm-gtk-greeter -y
$install $systemCore -y
$installNR $systemSupport -y
reboot

