# ScanXploit
A versatile and efficient Port Scanner tool built using Bash scripting and nmap. This tool provides various scanning options to analyze open ports, detect operating systems, and identify vulnerabilities on the target IP address, making it valuable for network diagnostics and cybersecurity enthusiasts.

# Table of Contents
1. Features
2. Prerequisites
3. Installation
4. Usage
5. Menu Options
6. Example Output
7. Contributing
8. License
# Features
- Multi-option port scanning and OS detection
- Animated ASCII banner display on startup
- Scans for open ports, service versions, operating systems, and vulnerabilities
- Custom learning module to fetch information about specific ports from port_info.txt
# Prerequisites
- Bash (Linux/macOS)
- nmap (Network Mapper): Install using sudo apt-get install nmap (Debian/Ubuntu) or brew install nmap (macOS)
- port_info.txt: A file that includes detailed descriptions for specific ports, in the format:

80 - HTTP - HyperText Transfer Protocol</br>
443 - HTTPS - HTTP Secure Protocol
# Installation
Clone the repository and navigate to the project directory:</br>

git clone https://github.com/JenishBambhroliya/ScanXploit.git</br>
cd port-scanner-tool

- Ensure the script has executable permissions:

chmod +x port_scanner.sh
# Usage
- Run the tool by executing:

./port_scanner.sh

Follow the prompts to enter a target IP address and choose a scan option from the menu.

# Menu Options
1. Ping Scan: Checks if the target host is reachable.
2. Fast Port Scan: Scans the most common ports.
3. Specific Port Scan: Scans user-defined ports.
4. Service Version Detection: Detects versions of services running on open ports.
5. Operating System Detection: Detects the target’s operating system.
6. Traceroute Scan: Traces the route packets take to reach the host.
7. TCP SYN Scan: Stealth scan to detect open TCP ports.
8. UDP Scan: Scans for open UDP ports.
9. Vulnerability Scan: Identifies potential vulnerabilities.
10. HTTP Service Scan: Checks for open HTTP services.
11. Learn About Ports: Provides details about specified ports using port_info.txt.
12. Exit: Exit the tool.
# Example Output
- Example output for the Fast Port Scan:

[+] Enter the target IP address: 192.168.1.1</br>
Running Fast Port Scan on 192.168.1.1...</br>
PORT    STATE SERVICE</br>
22/tcp  open  ssh</br>
80/tcp  open  http</br>
443/tcp open  https</br>
# Contributing
Contributions are welcome! Please follow these steps:

1. Fork the project.
2. Create a new branch: git checkout -b feature-name.
3. Make your changes and commit: git commit -m "Add new feature".
4. Push the changes: git push origin feature-name.
5. Submit a pull request.
