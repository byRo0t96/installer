#!/bin/bash
# v.0.0.2
# uninstaller
# Coded by: Ro0t-96
# Github: https://github.com/byRo0t96
#!/bin/bash
printf '\033]2;uninstaller\a'
resize -s 30 100 > /dev/null
function banner() {
clear
printf "\e[1;31m"
echo " █    ██  ███▄    █  ██▓ ███▄    █   ██████ ▄▄▄█████▓ ▄▄▄v.0.0.2██▓     ██▓    ▓█████  ██▀███   ";
echo " ██  ▓██▒ ██ ▀█   █ ▓██▒ ██ ▀█   █ ▒██    ▒ ▓  ██▒ ▓▒▒████▄    ▓██▒    ▓██▒    ▓█   ▀ ▓██ ▒ ██▒ ";
echo "▓██  ▒██░▓██  ▀█ ██▒▒██▒▓██  ▀█ ██▒░ ▓██▄   ▒ ▓██░ ▒░▒██  ▀█▄  ▒██░    ▒██░    ▒███   ▓██ ░▄█ ▒ ";
echo "▓▓█  ░██░▓██▒  ▐▌██▒░██░▓██▒  ▐▌██▒  ▒   ██▒░ ▓██▓ ░ ░██▄▄▄▄██ ▒██░    ▒██░    ▒▓█  ▄ ▒██▀▀█▄   ";
echo "▒▒█████▓ ▒██░   ▓██░░██░▒██░   ▓██░▒██████▒▒  ▒██▒ ░  ▓█   ▓██▒░██████▒░██████▒░▒████▒░██▓ ▒██▒ ";
echo "░▒▓▒ ▒ ▒ ░ ▒░   ▒ ▒ ░▓  ░ ▒░   ▒ ▒ ▒ ▒▓▒ ▒ ░  ▒ ░░    ▒▒   ▓▒█░░ ▒░▓  ░░ ▒░▓  ░░░ ▒░ ░░ ▒▓ ░▒▓░ ";
echo "░░▒░ ░ ░ ░ ░░   ░ ▒░ ▒ ░░ ░░   ░ ▒░░ ░▒  ░ ░    ░      ▒   ▒▒ ░░ ░ ▒  ░░ ░ ▒  ░ ░ ░  ░  ░▒ ░ ▒░ ";
echo " ░░░ ░ ░    ░   ░ ░  ▒ ░   ░   ░ ░ ░  ░  ░    ░        ░   ▒     ░ ░     ░ ░      ░     ░░   ░  ";
echo "   ░              ░  ░           ░       ░                 ░  ░    ░  ░    ░  ░   ░  ░   ░      ";
echo "                                 https://github.com/byRo0t96";
printf "\e[0m"
read -p $'\e[1;37mRo0t-96>UNINSTALLER> Enter App Simple Name :' appname
read -p $'\e[1;37mRo0t-96>UNINSTALLER> Enter App icon + type :' appicon
read -p $'\e[1;37mRo0t-96>UNINSTALLER> Enter Folder Name     :' foldername
read -p $'\e[1;37mRo0t-96>UNINSTALLER> Enter File Name + type:' filename
echo """[Desktop Entry]
Name=$foldername
Comment=$foldername
Encoding=UTF-8
Exec=sh -c '$appname;${SHELL:-bash}'
Icon=$appicon
StartupNotify=false
Terminal=true
Type=Application
Categories=$foldername;
X-Kali-Package=$foldername
Name[C]=$foldername""" > $foldername.desktop
}

function linux() {
echo -e "$red [$green+$red]$off Checking directories..."
if [ -d "/usr/share/$foldername" ]; then
    echo -e "$red [$green+$red]$off A Directory $foldername Was Found! Do You Want To Unistall It? [Y/n]:" ;
    read replace
    if [ "$replace" = "y" ]; then
      sudo rm -r "/usr/local/bin/$appname"
      sudo rm -r "/usr/share/$foldername"
      sudo rm "/usr/share/icons/$appicon"
      sudo rm "/usr/share/applications/$foldername.desktop"

else
echo -e "$red [$green✘$red]$off If You Want To Uninstall You Must Remove Previous Installations";
echo -e "$red [$green✘$red]$off Uninstall Failed";
        exit
    fi
fi 
}

if [ -d "/usr/bin/" ];then
banner
echo -e "$red [$green+$red]$off $foldername Will Be uninstalled In Your System";
linux
else
    exit
fi
