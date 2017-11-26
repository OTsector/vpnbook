#!/bin/bash
### Welcome text
clear
red=`tput setaf 1`
green=`tput setaf 2`
grey=`tput setaf 8`
o=`tput setaf 65`
otext=`tput setaf 66`
t=`tput setaf 62`
ttext=`tput setaf 61`
reset=`tput sgr0`
bold=$(tput bold)
normal=$(tput sgr0)
banner=" \t\t ${bold}${t}_${reset}\n\t${bold}${o}0${reset}${normal}${bold}${t}7${reset}${normal}\t${o}[${reset}${t}|${reset}${o}]${reset}${normal} ${bold}${o}0${reset}${normal}${otext}ffensive${reset} ${bold}${t}7${reset}${normal}${ttext}ester${reset}\n\n\t# ${red}VPNBOOK${reset}${grey} - VPNBOOK Client v1.5.2${reset}\n"
echo -e ${banner}
### Welcome text
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 
	exit 1
fi
### Check addons
rm -rf temp && mkdir temp
if ! [ -d /etc/openvpn ] && ! [ -f /usr/bin/curl ] && ! [ -f /usr/bin/grep ] && ! [ -f /usr/bin/sed ]; then
	apt-get install openvpn -y
	apt-get install curl -y
	apt-get install grep -y
	apt-get install sed -y
	exit 1
fi
### Check addons
	echo "Starting ${green}${bold}VPN${normal}${reset} service..."
	wget https://www.vpnbook.com/free-openvpn-account/VPNBook.com-OpenVPN-Euro1.zip -q -O $PWD/temp/euro1.zip &>/dev/null
	unzip -o $PWD/temp/euro1.zip -d $PWD/temp/ &>/dev/null
	echo -e "vpnbook\n"$( echo $(echo $(curl -s https://www.vpnbook.com/ | echo $(grep "<li><strong>Password: " | head -1 )) | sed 's/<li><strong>Password: //g' | sed -e 's/<\/strong><\/li>//g'))"\n" > $PWD/temp/data.txt
	sed -i '$ d' $PWD/temp/data.txt
	echo -e "\nCTRL+C ${red}to exit${reset}"
	openvpn --config $PWD/temp/*53.ovpn --auth-user-pass $PWD/temp/data.txt &>/dev/null
exit 1 | clear && echo -e "${banner}\n${red}Disconnected${reset}"
