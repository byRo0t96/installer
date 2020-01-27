#!/bin/bash
# v.0.0.2
# installer
# Coded by: Ro0t-96
# Github: https://github.com/byRo0t96
#!/bin/bash
printf '\033]2;installer\a'
resize -s 30 100 > /dev/null
function banner() {
clear
printf "\e[1;31m"
echo " ▄█  ███▄▄▄▄      ▄████████     ███        ▄████████  ▄█        ▄█          ▄████████    ▄████████ ";
echo "███  ███▀▀▀██▄   ███    ███ ▀█████████▄   ███    ███ ███       ███ v.0.0.2 ███    ███   ███    ███ ";
echo "███▌ ███   ███   ███    █▀     ▀███▀▀██   ███    ███ ███       ███         ███    █▀    ███    ███ ";
echo "███▌ ███   ███   ███            ███   ▀   ███    ███ ███       ███        ▄███▄▄▄      ▄███▄▄▄▄██▀ ";
echo "███▌ ███   ███ ▀███████████     ███     ▀███████████ ███       ███       ▀▀███▀▀▀     ▀▀███▀▀▀▀▀   ";
echo "███  ███   ███          ███     ███       ███    ███ ███       ███         ███    █▄  ▀███████████ ";
echo "███  ███   ███    ▄█    ███     ███       ███    ███ ███▌    ▄ ███▌    ▄   ███    ███   ███    ███ ";
echo "█▀    ▀█   █▀   ▄████████▀     ▄████▀     ███    █▀  █████▄▄██ █████▄▄██   ██████████   ███    ███ ";
echo "                   https://github.com/byRo0t96       ▀         ▀                        ███    ███ ";
printf "\e[0m"
read -p $'\e[1;37mRo0t-96>INSTALLER> Enter App Simple Name :' appname
read -p $'\e[1;37mRo0t-96>INSTALLER> Enter App icon + type :' appicon
read -p $'\e[1;37mRo0t-96>INSTALLER> Enter Folder Name     :' foldername
read -p $'\e[1;37mRo0t-96>INSTALLER> Enter File Name + type:' filename
read -p $'\e[1;37mRo0t-96>INSTALLER> Enter Start Command   :' filetype
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
    echo -e "$red [$green+$red]$off A Directory $foldername Was Found! Do You Want To Replace It? [Y/n]:" ;
    read replace
    if [ "$replace" = "y" ]; then
      sudo rm -r "/usr/share/$foldername"
      sudo rm "/usr/share/icons/$appicon"
      sudo rm "/usr/share/applications/$foldername.desktop"
      sudo rm -r "/usr/local/bin/$appname"

else
echo -e "$red [$green✘$red]$off If You Want To Install You Must Remove Previous Installations";
echo -e "$red [$green✘$red]$off Installation Failed";
        exit
    fi
fi 

echo -e "$red [$green+$red]$off Installing ...";
echo -e "$red [$green+$red]$off Creating Symbolic Link ...";
echo -e "#!/bin/bash 
$filetype /usr/share/$foldername/$filename" '${1+"$@"}' > "$appname";
    chmod +x "$appname";
    sudo mkdir "/usr/share/$foldername"
    sudo cp "$foldername"/* "/usr/share/$foldername"
    sudo cp "$appicon" "/usr/share/icons"
    sudo cp "$foldername.desktop" "/usr/share/applications"
    sudo cp "$foldername" "/usr/local/bin/"
    sudo cp "$appname" "/usr/local/bin/"
    rm "$appname";
    rm "$foldername.desktop";

if [ -d "/usr/share/$foldername" ] ;
then
echo -e "$red [$green+$red]$off Tool Successfully Installed And Will Start In 5s!";
echo -e "$red [$green+$red]$off You can execute tool by typing $appname"
sleep 5;
$appname
else
echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
    exit
fi 
}

if [ -d "/usr/bin/" ];then
banner
echo -e "$red [$green+$red]$off $foldername Will Be Installed In Your System";
linux
echo """
App Simple Name : $appname
App icon + type : $appicon
Folder Name     : $foldername
File Name + type: $filename
Start Command   : $filetype
""" > $foldername.txt
else
echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System!";
    exit
fi
