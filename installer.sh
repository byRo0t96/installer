#!/bin/bash
# installer
# Coded by: Yasser Bdj (Boudjada Yasser)
# Github: https://github.com/yasserbdj96

V="v1.0.0"

#install:
function install() {
    read -p $'# [*] File PATH : ' filepath
    filename=$(python3 -c "f='$filepath'.split('/');f=f[len(f)-1];print(f)")
    name=`echo $filename | cut -d \. -f 1`
    type=`echo $filename | cut -d \. -f 2`
    appname=$name
    foldername=$name

    read -p $' [*] Enter Application Icon PATH : ' appiconpath
    appicon=$(python3 -c "f='$appiconpath'.split('/');f=f[len(f)-1];print(f)")

    if [ "$type" == "sh" ]; then
        filetype="bash"
    elif [ "$type" == "py" ]; then
        filetype="python3"
    elif [ "$type" == "pl" ]; then
        filetype="perl"
    elif [ "$type" == "rb" ]; then
        filetype="ruby"
    fi

echo """[Desktop Entry]
Name=$foldername
Comment=$foldername
Encoding=UTF-8
Exec=sh -c '$appname;${SHELL:-bash}'
Icon=$foldername.png
StartupNotify=false
Terminal=true
Type=Application
Categories=$foldername;
X-Kali-Package=$foldername
Name[C]=$foldername""" > $foldername.desktop

echo -e "#!/bin/bash 
$filetype /usr/share/$foldername/$filename" '${1+"$@"}' > "$appname";
chmod +x "$appname";
sudo mkdir "/usr/share/$foldername"
sudo cp "$filepath" "/usr/share/$foldername"
sudo cp "$appiconpath" "/usr/share/icons/$foldername.png"
sudo cp "$foldername.desktop" "/usr/share/applications"
sudo cp "$foldername" "/usr/local/bin/"
sudo cp "$appname" "/usr/local/bin/"
rm "$appname";
rm "$foldername.desktop";

if [ -d "/usr/share/$foldername" ]; then
    echo -e "Tool Successfully Installed!";
    echo -e "You can execute tool by typing '$appname'"
    sleep 2;
fi
}

#uninstall:
function uninstall() {
    read -p $'# [*] Enter Application Name : ' filename

    name=`echo $filename | cut -d \. -f 1`
    type=`echo $filename | cut -d \. -f 2`
    appname=$name
    foldername=$name

echo -e "Checking directories..."
if [ -d "/usr/share/$foldername" ]; then
    echo -e "A Directory $foldername Was Found! Do You Want To Unistall It? [Y/n]:" ;
    read replace
    if [ "$replace" = "Y" ]; then
      sudo rm -r "/usr/local/bin/$appname"
      sudo rm -r "/usr/share/$foldername"
      sudo rm "/usr/share/icons/$foldername.png"
      sudo rm "/usr/share/applications/$foldername.desktop"
    fi
fi
}


#start script:
if [ "$1" == "-i" ]; then
    printf '\033]2;installer\a'
    printf "\e[1;31m"
    echo " ▄█  ███▄▄▄▄      ▄████████     ███        ▄████████  ▄█        ▄█          ▄████████    ▄████████ ";
    echo "███  ███▀▀▀██▄   ███    ███ ▀█████████▄   ███    ███ ███       ███         ███    ███   ███    ███ ";
    echo "███▌ ███   ███   ███    █▀     ▀███▀▀██   ███    ███ ███       ███         ███    █▀    ███    ███ ";
    echo "███▌ ███   ███   ███            ███   ▀   ███    ███ ███       ███        ▄███▄▄▄      ▄███▄▄▄▄██▀ ";
    echo "███▌ ███   ███ ▀███████████     ███     ▀███████████ ███       ███       ▀▀███▀▀▀     ▀▀███▀▀▀▀▀   ";
    echo "███  ███   ███          ███     ███       ███    ███ ███       ███         ███    █▄  ▀███████████ ";
    echo "███  ███   ███    ▄█    ███     ███       ███    ███ ███▌    ▄ ███▌    ▄   ███    ███   ███    ███ ";
    echo "█▀    ▀█   █▀   ▄████████▀     ▄████▀     ███    █▀  █████▄▄██ █████▄▄██   ██████████   ███    ███ ";
    echo "                                                     ▀         ▀                        ███    ███ ";
    printf "\e[0m"
python3 -c "import yasserbdj96;print(yasserbdj96.about('$V'))"
    install
elif [ "$1" == "-u" ]; then
    printf '\033]2;uninstaller\a'
    printf "\e[1;31m"
    echo " █    ██  ███▄    █  ██▓ ███▄    █   ██████ ▄▄▄█████▓ ▄▄▄       ██▓     ██▓    ▓█████  ██▀███   ";
    echo " ██  ▓██▒ ██ ▀█   █ ▓██▒ ██ ▀█   █ ▒██    ▒ ▓  ██▒ ▓▒▒████▄    ▓██▒    ▓██▒    ▓█   ▀ ▓██ ▒ ██▒ ";
    echo "▓██  ▒██░▓██  ▀█ ██▒▒██▒▓██  ▀█ ██▒░ ▓██▄   ▒ ▓██░ ▒░▒██  ▀█▄  ▒██░    ▒██░    ▒███   ▓██ ░▄█ ▒ ";
    echo "▓▓█  ░██░▓██▒  ▐▌██▒░██░▓██▒  ▐▌██▒  ▒   ██▒░ ▓██▓ ░ ░██▄▄▄▄██ ▒██░    ▒██░    ▒▓█  ▄ ▒██▀▀█▄   ";
    echo "▒▒█████▓ ▒██░   ▓██░░██░▒██░   ▓██░▒██████▒▒  ▒██▒ ░  ▓█   ▓██▒░██████▒░██████▒░▒████▒░██▓ ▒██▒ ";
    echo "░▒▓▒ ▒ ▒ ░ ▒░   ▒ ▒ ░▓  ░ ▒░   ▒ ▒ ▒ ▒▓▒ ▒ ░  ▒ ░░    ▒▒   ▓▒█░░ ▒░▓  ░░ ▒░▓  ░░░ ▒░ ░░ ▒▓ ░▒▓░ ";
    echo "░░▒░ ░ ░ ░ ░░   ░ ▒░ ▒ ░░ ░░   ░ ▒░░ ░▒  ░ ░    ░      ▒   ▒▒ ░░ ░ ▒  ░░ ░ ▒  ░ ░ ░  ░  ░▒ ░ ▒░ ";
    echo " ░░░ ░ ░    ░   ░ ░  ▒ ░   ░   ░ ░ ░  ░  ░    ░        ░   ▒     ░ ░     ░ ░      ░     ░░   ░  ";
    echo "   ░              ░  ░           ░       ░                 ░  ░    ░  ░    ░  ░   ░  ░   ░      ";
    printf "\e[0m"
python3 -c "import yasserbdj96;print(yasserbdj96.about('$V'))"
    uninstall
else
    echo "usage: $0 <OPTION>"
fi