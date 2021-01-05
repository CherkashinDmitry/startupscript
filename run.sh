#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "you have no permission fagot"
  exit
fi

#-------BASIC-INSTALLATION------
echo "\e[93m----------------basic installation..."
apt install -y -qq htop build-essential git vim net-tools psmisc acpi sudo ranger elinks dhcpcd wicd cmus neofetch
/sbin/usermod -aG sudo spacebar
echo "\e[92m--------Done!"
echo "\e[93m----------------GUI installation..."
apt install -y -qq xorg mesa-utils xorg openbox obconf rofi xfonts-terminus lxappearance lemonbar
echo "\e[92m--------Done!"
#-------BUILDIN-GIT-STUFF-------
echo "\e[93mInstalling login manager..."
if ! [ -f /home/spacebar/ ]; 
	then cd /home/spacebar
	else cd ~
fi
mkdir GIT 
cd GIT
git clone https://github.com/nullgemm/ly
apt -y -qq install build-essential libpam0g-dev libxcb-xkb-dev
cd ly
make github
make 
make install

echo "\e[92m--------Done!"
echo "\e[93mInstalling composer..."
cd ../
git clone https://github.com/tryone144/compton
cd compton
apt install -y libx11-dev libxcomposite-dev libxdamage-dev libxfixes-dev libxext-dev libxrender-dev libxrandr-dev libxinerama-dev pkg-config x11proto-dev x11-utils libpcre++-dev libconfig-dev libdrm-dev libgl-dev libdbus-1-dev asciidoc


dpkg -P --force-depends libpam0g-dev libxcb-xkb-dev

