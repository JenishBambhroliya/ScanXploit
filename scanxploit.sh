#!/bin/bash

# Colors for output
RED='\033[0;31m'
r="\e[31;1m"
b="\e[32;1m" # blue
GREEN='\033[0;32m'
g='\033[38;5;40m'
YELLOW='\033[1;33m'
w="\e[0;1m"
p="\e[35;1m" #purple
NC='\033[0m' # No color

# Function to display a header
# Colors for output
red='\033[38;5;196m'   # Red color
NC='\033[0m'          # No color

# Function to print the banner
function print_banner() {
    local lines=(       
"███████╗ ██████╗ █████╗ ███╗   ██╗██╗  ██╗██████╗ ██╗      ██████╗ ██╗████████╗  "
"██╔════╝██╔════╝██╔══██╗████╗  ██║╚██╗██╔╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝  " 
"███████╗██║     ███████║██╔██╗ ██║ ╚███╔╝ ██████╔╝██║     ██║   ██║██║   ██║     "
"╚════██║██║     ██╔══██║██║╚██╗██║ ██╔██╗ ██╔═══╝ ██║     ██║   ██║██║   ██║     "
"███████║╚██████╗██║  ██║██║ ╚████║██╔╝ ██╗██║     ███████╗╚██████╔╝██║   ██║     "
"╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝     "

"                                                                  ╔By - Jenish  ╗"
"                                                                  ║     Divyesh ║"
"                                                                  ║     Pratik  ║"
"                                                                  ╚     Govind  ╝" 
"-----------------------------------------------------------------------------------------------------------"                                                                              
    )
    local delay=0.0001  # Delay between characters

    clear
    for line in "${lines[@]}"; do
        for ((i=0; i<${#line}; i++)); do
            echo -n -e "${red}${line:$i:1}${NC}"
            sleep $delay
        done
        echo  # Move to the next line
    done
}

# Clear the screen and run the banner function
clear
print_banner



# Function to prompt for IP input
function get_target_ip() {
    echo -ne "${r}enter the target IP address: " 
    read TARGET_IP
}

echo -e "   "


# Function to display the menu
function display_menu() {
    echo -e "${r}Select an option::"
    echo -e "                    "
    echo -e "${p}[${b}1${p}]${w} Ping Scan"
    echo -e "${p}[${b}2${p}]${w} Fast Port Scan"
    echo -e "${p}[${b}3${p}]${w} Specific Port Scan"
    echo -e "${p}[${b}4${p}]${w} Service Version Detection"
    echo -e "${p}[${b}5${p}]${w} Operating System Detection"
    echo -e "${p}[${b}6${p}]${w} Traceroute Scan"
    echo -e "${p}[${b}7${p}]${w} TCP SYN Scan"
    echo -e "${p}[${b}8${p}]${w} UDP Scan"
    echo -e "${p}[${b}9${p}]${w} Vulnerability Scan"
    echo -e "${p}[${b}10${p}]${w} HTTP Service Scan"
    echo -e "${p}[${b}11${p}]${w} Learn About Ports"
    echo -e "${p}[${b}0${p}]${w} Exit"
    echo -e "${NC}"
}

# Function for each menu option

# 1. Ping Scan
function ping_scan() {
    echo -e "${w}[${b}*${w}] ${b}Running Ping Scan on $TARGET_IP...${NC}"
    nmap -sn $TARGET_IP
}

# 2. Fast Port Scan
function fast_scan() {
    echo -e "${w}[${b}*${w}] ${b}Running Fast Port Scan on $TARGET_IP...${NC}"
    nmap -F $TARGET_IP
}

# 3. Specific Port Scan (new option)
function specific_port_scan() {
    echo -e "${b}Enter the port or ports to scan (e.g., 22 or 80,443 or 1-1000): " 
    read PORTS
    echo -e "${w}[${b}*${w}] ${b}Scanning specific port(s) $PORTS on $TARGET_IP...${NC}"
    nmap -p $PORTS $TARGET_IP
}

# 4. Service Version Detection
function service_version_scan() {
    echo -e "${w}[${b}*${w}] ${b}Detecting Service Versions on $TARGET_IP...${NC}"
    nmap -sV $TARGET_IP
}

# 5. Operating System Detection
function os_detection() {
    echo -e "${w}[${b}*${w}] ${b}Running OS Detection on $TARGET_IP...${NC}"
    nmap -O $TARGET_IP
}

# 6. Traceroute Scan
function traceroute_scan() {
    echo -e "${w}[${b}*${w}] ${b}Running Traceroute Scan on $TARGET_IP...${NC}"
    nmap -sn --traceroute $TARGET_IP
}

# 7. TCP SYN Scan (Stealth Scan)
function syn_scan() {
    echo -e "${w}[${b}*${w}] ${b}Running TCP SYN Scan on $TARGET_IP...${NC}"
    nmap -p 1-1000 -T4 -A -v $TARGET_IP
}

# 8. UDP Scan
function udp_scan() {
    echo -e "${w}[${b}*${w}] ${b}Running UDP Scan on $TARGET_IP...${NC}"
    nmap -sS -sU -T4 -A -v $TARGET_IP
}

# 9. Vulnerability Scan with Nmap Scripting Engine (NSE)
function vulnerability_scan() {
    echo -e "${w}[${b}*${w}] ${b}Running Vulnerability Scan on $TARGET_IP...${NC}"
    nmap -v --script vuln $TARGET_IP
}

# 10. Scan for Open HTTP Services
function http_service_scan() {
    echo -e "${w}[${b}*${w}] ${b}Scanning for Open HTTP Services on $TARGET_IP...${NC}"
    nmap -p 80,443 --open $TARGET_IP
}

#11. 
function learn_about_ports() {
    echo -ne "${b}Enter the port number(s) you want to learn about (comma separated): " 
    read PORTS
    echo -e "${w}[${b}*${w}] ${b}Getting information for port(s): $PORTS...${NC}"
    IFS=',' read -r -a port_array <<< "$PORTS"
    
    found_any=false  # Flag to check if any port information was found

    for port in "${port_array[@]}"; do
        # Use grep to find the port description from the file
        port_info=$(grep "^$port -" port_info.txt)

        if [ -n "$port_info" ]; then
            echo -e "${GREEN}$port_info${NC}"  # Print the port info
            found_any=true
        else
            echo -e "${RED}No information found for port $port.${NC}"  # Error message
        fi
    done

    # If no port information was found
    if [ "$found_any" = false ]; then
        echo -e "${RED}No valid port information was found.${NC}"
    fi
}

# Main logic to prompt for IP once and then display the menu in a loop
echo -e "${r}[${w}+${r}]${w} Enter the target IP address: " 
read TARGET_IP

echo -e "                  "

while true; do
    display_menu
    echo -ne "${YELLOW}[${p}~${YELLOW}] ${r}Enter your choice: "
    read choice
    case $choice in
        1)
            ping_scan
            ;;
        2)
            fast_scan
            ;;
        3)
            specific_port_scan
            ;;
        4)
            service_version_scan
            ;;
        5)
            os_detection
            ;;
        6)
            traceroute_scan
            ;;
        7)
            syn_scan
            ;;
        8)
            udp_scan
            ;;
        9)
            vulnerability_scan
            ;;
        10)
            http_service_scan
            ;;
        11)
            learn_about_ports
            ;;
        0)
            echo -e "${r}Exiting...${NC}"
            exit 0
            ;;
        *)
            echo -e "${r}Invalid option! Please select a valid number.${NC}"
            ;;
    esac

    # Pause to view output before returning to the menu
    echo -e "${g}Press Enter to continue...${NC}"
    read
done
