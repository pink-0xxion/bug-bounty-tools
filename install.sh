#!/usr/bin/bash


OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKORANGE='\033[93m'
RESET='\e[0m'

#see figlet tool do this way <--try it
#!/bin/bash

echo -e "\e[31m   _____                    _____                    _____          \e[0m"
echo -e "\e[31m  /\    \                  /\    \                  /\    \         \e[0m"
echo -e "\e[31m /::\____\                /::\____\                /::\____\        \e[0m"
echo -e "\e[34m/::::|   |               /:::/    /               /:::/    /        \e[0m"
echo -e "\e[34m:::::|   |              /:::/    /               /:::/    /         \e[0m"
echo -e "\e[34m::::::|   |             /:::/    /               /:::/    /          \e[0m"
echo -e "\e[31m::::/|::|   |            /:::/____/               /:::/    /           \e[0m"
echo -e "\e[31m:::/ |::|   |           /::::\    \              /:::/    /            \e[0m"
echo -e "\e[31m::/   |::|___|______    /::::::\____\________    /:::/____/             \e[0m"
echo -e "\e[34m/     |::::::::\    \  /:::/\:::::::::::\    \  /:::/    /              \e[0m"
echo -e "\e[34m      |:::::::::\____\/:::/  |:::::::::::\____\/:::/    /               \e[0m"
echo -e "\e[34m      / ~~~~~/:::/    /\::/   |::|~~~|~~~~~     \::/    /                \e[0m"
echo -e "\e[34m     /     /:::/    /  \/____|::|   |           \/____/                 \e[0m"
echo -e "\e[34m    /_____/:::/    /         |::|   |                                    \e[0m"
echo -e "\e[34m          /:::/    /          |::|   |                                    \e[0m"
echo -e "\e[34m         /:::/    /           |::|   |                                    \e[0m"
echo -e "\e[34m        /:::/    /            |::|   |                                    \e[0m"
echo -e "\e[34m       /:::/    /             |::|   |                                    \e[0m"
echo -e "\e[34m      /:::/    /              |::|   |                                    \e[0m"
echo -e "\e[34m     /:::/    /               |::|   |                                    \e[0m"
echo -e "\e[31m     \::/    /                |::|   |                                    \e[0m"
echo -e "\e[31m      \/____/                 \/___|_|                                    \e[0m"

#put update and upgrade lines so tools like eyewitness not give error
#sudo apt-get update &>/dev/null && echo "apt-get update succeeded."

#install go and python/3 if not installed <---requirements
# Check if Go is installed and install if not
if ! command -v go &> /dev/null; then
    echo "Go is not installed. Installing Go..."
    wget -q https://dl.google.com/go/go1.17.5.linux-amd64.tar.gz
    tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz
    rm go1.17.5.linux-amd64.tar.gz
    export PATH=$PATH:/usr/local/go/bin
    echo "Go installed successfully."
else
    echo "Go is already installed."
fi

# Check if Python is installed and install if not
if ! command -v python &> /dev/null; then
    echo "Python is not installed. Installing Python..."
    apt-get update
    apt-get install python -y
    echo "Python installed successfully."
else
    echo "Python is already installed."
fi

# Check if Python3 is installed and install if not
if ! command -v python3 &> /dev/null; then
    echo "Python3 is not installed. Installing Python3..."
    apt-get update
    apt-get install python3 -y
    echo "Python3 installed successfully."
else
    echo "Python3 is already installed."
fi

echo "Go, Python, and Python3 installation complete!"



# Backup .bashrc and .zshrc if backup files don't already exist
if [ ! -f ~/.bashrc.bak ]; then
    cp ~/.bashrc ~/.bashrc.bak
fi
if [ ! -f ~/.zshrc.bak ]; then
    cp ~/.zshrc ~/.zshrc.bak
fi

#bugtools directory
if [ ! -d ~/jhar/bugtools ] ; then
    mkdir ~/jhar/bugtools && echo "bugtools Directory created."
else
    echo "Directory already exists."
fi

cd ~/jhar/bugtools

echo "you are in $(pwd)"

#-----requirements-----#
if ! command -v pip3 &> /dev/null; then
            # Install pip3
            sudo apt-get update
            sudo apt-get -y install python3-pip
fi

#code for installtion of go lang
#try to use gf to find vuln like sql and xss <---SEE-IT
#go install github.com/tomnomnom/assetfinder@latest


#-----ffuf-----#
FFUF=$(which httpx)

if [ "$FFUF" ] ; then
	echo "ffuf is already installed"
else
	go install github.com/ffuf/ffuf/v2@latest
	cd ~/go/bin && sudo cp ffuf /usr/bin
fi

#-----qsreplace-----#
QSREPLACE=$(which qsreplace)

if [ "$QSREPLACE" ] ; then
	echo "qsreplace is already installed"
else
	go install github.com/tomnomnom/qsreplace@latest
	cd ~/go/bin && sudo cp qsreplace /usr/bin
fi



#-----httpx-----#
HTTPX=$(which httpx)

if [ "$HTTPX" ] ; then
	echo "httpx is already installed"
else
	go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
	cd ~/go/bin && sudo cp httpx /usr/bin
fi


#-----httprobe-----#
HTTPROBE=$(which httprobe)

if [ "$HTTPROBE" ] ; then
	echo "httprobe is already installed"
else
	go install github.com/tomnomnom/httprobe@latest	
	cd ~/go/bin && sudo cp httprobe /usr/bin
fi


#-----waybackurls-----#
WAYBACK=$(which waybackurls)

if [ "$WAYBACK" ] ; then
	echo "waybackurls is already installed"
else
	go install github.com/tomnomnom/waybackurls@latest
	cd ~/go/bin && sudo cp waybackurls /usr/bin
fi

#-----gau-----#
GAU=$(which gau)

if [ "$GAU" ] ; then
	echo "gua is already installed"
else
	go install github.com/lc/gau/v2/cmd/gau@latest
	cd ~/go/bin && sudo cp gau /usr/bin
fi



#-----anew-----#
ANEW=$(which anew)

if [ "$ANEW" ] ; then
	echo "anew is already installed"
else
	go install github.com/tomnomnom/anew@latest
	cd ~/go/bin && sudo cp anew /usr/bin
fi

#-----kxss-----#
KXSS=$(which kxss)

if [ "$KXSS" ] ; then
	echo "kxss is already installed"
else
	go install github.com/Emoe/kxss@latest
	cd ~/go/bin && sudo cp kxss /usr/bin
fi


#-----findomain-----#
FINDOMAIN=$(which findomain)

if [ "$FINDOMAIN" ] ; then
	echo "findomain is already installed"
else
	curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip
	unzip findomain-linux-i386.zip
	chmod +x findomain
	sudo mv findomain /usr/bin/findomain
	
	FINDOMAIN=$(which findomain)
	if [ "$FINDOMAIN" ] ; then
		echo "findomain is installed now"
	fi

fi

#-----sublist3r-----#
#SUBLIST3R=$(alias sublister)
#echo $SUBLIST3R
#if [ $? -eq  0 ] ; then
#	echo "sublist3r is already installed"
#else
#	git clone https://github.com/aboul3la/Sublist3r.git
#	cd Sublist3r
#	pip install -r requirements.txt
#	alias sublister='python3 ~/jhar/bugtools/Sublist3r/sublist3r.py' 
#
#	SUBLIST3R=$(alias sublister)
#
#	if [ "$SUBLIST3R" ] ; then
#		echo "sublist3r is installed now"
#	fi
#fi
#--------------------------------



# Check if alias is already created
if grep -q 'alias sublister="python3 ~/jhar/bugtools/Sublist3r/sublist3r.py"' ~/.bashrc && grep -q 'alias sublister="python3 ~/jhar/bugtools/Sublist3r/sublist3r.py"' ~/.zshrc; then
    echo "Sublister alias is already created."
else
    # Check if Sublist3r is already installed
    if command -v sublist3r.py &>/dev/null; then
        echo "Sublist3r is already installed."
    else
        git clone https://github.com/aboul3la/Sublist3r.git
        cd Sublist3r
        sudo pip3 install -r requirements.txt
        chmod +x sublist3r.py
    fi

    # Add Sublist3r to PATH
    echo 'export PATH="$PATH:'~/jhar/bugtools/Sublist3r'"' >> ~/.bashrc
    echo 'export PATH="$PATH:'~/jhar/bugtools/Sublist3r'"' >> ~/.zshrc

    # Create alias for Sublist3r
    echo 'alias sublister="python3 ~/jhar/bugtools/Sublist3r/sublist3r.py"' >> ~/.bashrc
    echo 'alias sublister="python3 ~/jhar/bugtools/Sublist3r/sublist3r.py"' >> ~/.zshrc

    # Reload shell
    source ~/.bashrc
    source ~/.zshrc

    # Done
    echo "Sublist3r installation and alias creation complete!"
fi



#------paramspider------#
# Check if alias is already created
if grep -q 'alias paramspider="python3 ~/jhar/bugtools/ParamSpider/paramspider.py"' ~/.bashrc && grep -q 'alias paramspider="python3 ~/jhar/bugtools/ParamSpider/paramspider.py"' ~/.zshrc; then
    echo "paramspider alias is already created."
else
    # Check if paramspider is already installed
    if command -v paramspider.py &>/dev/null; then
        echo "paramspider is already installed."
    else
	git clone https://github.com/devanshbatham/ParamSpider.git
        cd ParamSpider
        sudo pip3 install -r requirements.txt
        chmod +x paramspider.py
    fi

    # Add paramspider to PATH
    echo 'export PATH="$PATH:'~/jhar/bugtools/ParamSpider'"' >> ~/.bashrc
    echo 'export PATH="$PATH:'~/jhar/bugtools/ParamSpider'"' >> ~/.zshrc

    # Create alias for paramspider
    echo 'alias paramspider="python3 ~/jhar/bugtools/ParamSpider/paramspider.py"' >> ~/.bashrc
    echo 'alias paramspider="python3 ~/jhar/bugtools/ParamSpider/paramspider.py"' >> ~/.zshrc

    # Reload shell
    source ~/.bashrc
    source ~/.zshrc

    # Done
    echo "paramspider installation and alias creation complete!"
fi


#------xsstrike------#
# Check if alias is already created
if grep -q 'alias xsstrike="python3 ~/jhar/bugtools/XSStrike/xsstrike.py"' ~/.bashrc && grep -q 'alias xsstrike="python3 ~/jhar/bugtools/XSStrike/xsstrike.py"' ~/.zshrc; then
    echo "xsstrike alias is already created."
else
    # Check if xsstrike is already installed
    if command -v xsstrike.py &>/dev/null; then
        echo "xsstrike is already installed."
    else
	git clone https://github.com/s0md3v/XSStrike.git
        cd XSStrike
        sudo pip3 install -r requirements.txt
        chmod +x xsstrike.py
    fi

    # Add xssstrike to PATH
    echo 'export PATH="$PATH:'~/jhar/bugtools/XSStrike'"' >> ~/.bashrc
    echo 'export PATH="$PATH:'~/jhar/bugtools/XSStrike'"' >> ~/.zshrc

    # Create alias for paramspider
    echo 'alias xsstrike="python3 ~/jhar/bugtools/XSStrike/xsstrike.py"' >> ~/.bashrc
    echo 'alias xsstrike="python3 ~/jhar/bugtools/XSStrike/xsstrike.py"' >> ~/.zshrc

    # Reload shell
    source ~/.bashrc
    source ~/.zshrc

    # Done
    echo "xsstrike installation and alias creation complete!"
fi

#--------GF--------#
# Install GF
if  command -v gf &> /dev/null; then
	echo $?
    echo "GF not found. Installing GF..."
    go install github.com/tomnomnom/gf@latest
    echo "GF installed successfully."
else
	echo $?
    echo "GF is already installed."
fi

# Set up GF patterns
if [ ! -d ~/.gf ]; then
    echo "GF patterns not found. Setting up GF patterns..."
    git clone https://github.com/tomnomnom/gf.git ~/.gf
    echo "GF patterns set up successfully."
else
    echo "GF patterns are already set up."
fi

# Set up GF autocompletion
if [ ! -f ~/.gf-completion.sh ]; then
    echo "GF autocompletion not found. Setting up GF autocompletion..."
    gf completion bash > ~/.gf-completion.sh
    echo "GF autocompletion set up successfully."
else
    echo "GF autocompletion is already set up."
fi

# Set up GF alias in .bashrc
if ! grep -q "alias gf" ~/.bashrc; then
    echo "GF alias not found in .bashrc. Setting up GF alias..."
    echo "alias gf='~/go/bin/gf'" >> ~/.bashrc
    source ~/.bashrc
    echo "GF alias set up successfully in .bashrc."
else
    echo "GF alias is already set up in .bashrc."
fi

# Set up GF alias in .zshrc
if ! grep -q "alias gf" ~/.zshrc; then
    echo "GF alias not found in .zshrc. Setting up GF alias..."
    echo "alias gf='~/go/bin/gf'" >> ~/.zshrc
    source ~/.zshrc
    echo "GF alias set up successfully in .zshrc."
else
    echo "GF alias is already set up in .zshrc."
fi

echo "GF installation and setup complete!"


#-------eyewitness-------#
#checking if tools is installed or not is not ecough what you did here
#you are only checking for alias that exits in bash zsh file as well as seeing that command exits or not
#what if i already downloaded the tool and kept it it different folder
#the below code will install the tool depite it already downloaded <---need to solve this problem

# Check if alias is already created
if grep -q 'alias eyewitness="python3 ~/jhar/bugtools/EyeWitness/Python/EyeWitness.py"' ~/.bashrc && grep -q 'alias eyewitness="python3 ~/jhar/bugtools/EyeWitness/Python/EyeWitness.py"' ~/.zshrc; then
    echo "eyewitness alias is already created."
else
    # Check if eyewitness is already installed
    if command -v EyeWitness.py &>/dev/null; then
        echo "eyewitness is already installed."
    else
	git clone https://github.com/FortyNorthSecurity/EyeWitness.git
        cd EyeWitness/Python/setup
	sudo ./setup.sh
	cd ../
        chmod +x EyeWitness.py
    fi

    # Add eyewitness to PATH
    echo 'export PATH="$PATH:'~/jhar/bugtools/EyeWitness/Python/'"' >> ~/.bashrc
    echo 'export PATH="$PATH:'~/jhar/bugtools/EyeWitness/Python/'"' >> ~/.zshrc

    # Create alias for eyewitness
    echo 'alias eyewitness="python3 ~/jhar/bugtools/EyeWitness/Python/EyeWitness.py"' >> ~/.bashrc
    echo 'alias eyewitness="python3 ~/jhar/bugtools/EyeWitness/Python/EyeWitness.py"' >> ~/.zshrc

    # Reload shell
    source ~/.bashrc
    source ~/.zshrc

    # Done
    echo "eyewitness installation and alias creation complete!"
fi


#------wafw00f------#
# Check if wafw00f is already installed
    if command -v wafw00f &>/dev/null; then
        echo "wafw00f is already installed."
    else
        git https://github.com/EnableSecurity/wafw00f.git
        cd wafw00f
        sudo python3 setup.py install
	which wafw0f
    fi

#also install whatwaf <--it also try to bypass the firewalls
#restart kali so alias added in .bashrc and .zshrc can take effect <----IMPORTANT

#crt.sh, go-stare<---add automatic installing in this script 













