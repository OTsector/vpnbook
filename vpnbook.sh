#!/bin/bash
### Welcome text
clear
red=`tput setaf 1`
grey=`tput setaf 8`
o=`tput setaf 65`
otext=`tput setaf 66`
t=`tput setaf 62`
ttext=`tput setaf 61`
ear=`tput setaf 8`
eye=`tput setaf 65`
mouth=`tput setaf 132`
reset=`tput sgr0`
bold=$(tput bold)
normal=$(tput sgr0)
banner="\t\t\t${red}VPNBOOK${reset}${grey} - VPNBOOK Connecter v1.1.2${reset}\n ${ear}^${reset}${eye}>${reset}${mouth}_${reset}${eye}<${reset}${ear}^${reset}\t\t ${bold}${t}_${reset}\n\t${bold}${o}0${reset}${normal}${bold}${t}7${reset}${normal}\t${o}[${reset}${t}|${reset}${o}]${reset}${normal} ${bold}${o}0${reset}${normal}${otext}ffensive${reset} ${bold}${t}7${reset}${normal}${ttext}ester${reset}\n"
echo -e ${banner}

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 
	exit 1
fi
### Check addons
rm -rf data.txt
if ! [ -d /etc/openvpn ] && ! [ -f /usr/bin/curl ] && ! [ -f /usr/bin/grep ] && ! [ -f /usr/bin/sed ]; then
	apt-get install openvpn -y
	apt-get install curl -y
	apt-get install grep -y
	apt-get install sed -y
	exit 1
fi


	echo -e "vpnbook\n"$( echo $(echo $(curl -s https://www.vpnbook.com/#openvpn | echo $(grep "<li><strong>Password: " | head -1 )) | tr -d "<li><strong>Password: //"))"\n" > data.txt
	sed -i '$ d' data.txt
	openvpn vpnbook-de233-tcp80.ovpn &>/dev/null

exit 0
