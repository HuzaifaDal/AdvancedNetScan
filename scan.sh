#!/bin/bash

# Automated Network Reconnaissance Script
# Created based on Cyber Basics Project Template

# Text colors for better readability
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Banner
echo -e "${BLUE}=================================================${NC}"
echo -e "${GREEN}                 DAL SCANNER                    ${NC}"
echo -e "${GREEN}        Advanced Network Reconnaissance         ${NC}"
echo -e "${BLUE}=================================================${NC}"

# Check if nmap is installed
if ! command -v nmap &> /dev/null; then
    echo -e "${RED}Error: Nmap is not installed. Please install it using:${NC}"
    echo -e "${YELLOW}sudo apt install nmap${NC} (for Debian/Ubuntu)"
    echo -e "${YELLOW}sudo yum install nmap${NC} (for CentOS/RHEL)"
    exit 1
fi

# Create results directory if it doesn't exist
if [ ! -d "results" ]; then
    mkdir -p results
    echo -e "${GREEN}Created results directory.${NC}"
fi

# Get target from user
read -p "Enter the target IP or domain: " target

# Validate input is not empty
if [ -z "$target" ]; then
    echo -e "${RED}Error: Target cannot be empty.${NC}"
    exit 1
fi

# Generate a timestamp for the filename
timestamp=$(date +"%Y%m%d_%H%M%S")
filename="results/${target}_${timestamp}_scan.txt"

# Log header
echo "=========================================" > $filename
echo "  Network Reconnaissance Report" >> $filename
echo "  Target: $target" >> $filename
echo "  Date: $(date)" >> $filename
echo "=========================================" >> $filename

# Display scan information
echo -e "${GREEN}Scanning host: ${YELLOW}$target${NC}"
echo -e "${GREEN}Results will be saved in: ${YELLOW}$filename${NC}"

# Function to run a scan and update progress
run_scan() {
    local scan_type=$1
    local scan_command=$2
    
    echo -e "\n${BLUE}Running $scan_type...${NC}"
    echo -e "\n=== $scan_type ===" >> $filename
    
    # Execute the nmap command and save output
    eval "$scan_command" >> $filename 2>&1
    
    echo -e "${GREEN}✓ $scan_type completed${NC}"
}

# Ping Scan
run_scan "Ping Scan" "nmap -sn $target"

# Basic Port Scan
run_scan "Basic Port Scan" "nmap -sS $target"

# Comprehensive Port Scan
echo -e "\n${BLUE}Running Comprehensive Port Scan...${NC}"
echo -e "\n=== Comprehensive Port Scan ===" >> $filename
echo -e "${YELLOW}This may take some time depending on the target.${NC}"
nmap -p- -T4 $target >> $filename 2>&1
echo -e "${GREEN}✓ Comprehensive Port Scan completed${NC}"

# Service Version and OS Detection
run_scan "Service Version & OS Detection" "nmap -sV -O $target"

# Advanced Vulnerability Scan
run_scan "Script Scan (Common Vulnerabilities)" "nmap -sS -sC $target"

# Completion message
echo -e "\n${GREEN}Scan completed successfully!${NC}"
echo -e "${GREEN}Full scan results saved to: ${YELLOW}$filename${NC}"

# Summary of findings (basic parsing of results)
echo -e "\n${GREEN}Quick Summary:${NC}"
echo "=============="
echo -e "${YELLOW}Open ports:${NC}"
grep "open" $filename | grep -v "filtered" | sort -u

echo -e "\n${YELLOW}Operating System Detection:${NC}"
grep "OS:" $filename | head -n 3

echo -e "\n${BLUE}To view full results:${NC} cat $filename"

# Display author information
echo -e "\n${BLUE}=================================================${NC}"
echo -e "${GREEN}       Made by HuzaifaDal - Thank you!         ${NC}"
echo -e "${BLUE}=================================================${NC}"
