# AdvancedNetScan
# DAL SCANNER

Dal Scanner is a powerful network reconnaissance tool that automates various Nmap scanning tasks. This tool helps security professionals and enthusiasts gather information about networks, identify potential vulnerabilities, and save results for later analysis in an organized format.

![Network Scanning](https://raw.githubusercontent.com/your-username/nmap-bash-scanner/main/screenshots/scan-demo.png)

## Features

- **Multiple Scan Types**:
  - Ping scan (host discovery)
  - Basic port scan
  - Comprehensive port scan (all 65535 ports)
  - OS detection
  - Service version detection
  - Common vulnerability scripts scan

- **User-Friendly Interface**:
  - Color-coded output for better readability
  - Progress indicators
  - Summary reports

- **Automated Results Storage**:
  - Organized output files with timestamps
  - Both detailed logs and quick summaries

## Prerequisites

- Linux operating system (Ubuntu, Debian, CentOS, etc.)
- Nmap package installed
- Bash shell

## Installation

1. Clone this repository:
```bash
git clone https://github.com/your-username/dal-scanner.git
cd dal-scanner
```

2. Make the script executable:
```bash
chmod +x scan.sh
```

3. Ensure Nmap is installed:
```bash
# For Debian/Ubuntu
sudo apt install nmap

# For CentOS/RHEL
sudo yum install nmap
```

## Usage

1. Run the script:
```bash
./scan.sh
```

2. Enter the target IP address or domain name when prompted.

3. Wait for the scans to complete.

4. Review the results in the terminal or check the detailed output file in the `results` directory.

## Example Output

```
=================================================
                 DAL SCANNER                    
        Advanced Network Reconnaissance         
=================================================
Scanning host: scanme.nmap.org
Results will be saved in: results/scanme.nmap.org_20230515_123456_scan.txt

Running Ping Scan...
✓ Ping Scan completed

Running Basic Port Scan...
✓ Basic Port Scan completed

Running Comprehensive Port Scan...
This may take some time depending on the target.
✓ Comprehensive Port Scan completed

Running Service Version & OS Detection...
✓ Service Version & OS Detection completed

Running Script Scan (Common Vulnerabilities)...
✓ Script Scan (Common Vulnerabilities) completed

Scan completed successfully!
Full scan results saved to: results/scanme.nmap.org_20230515_123456_scan.txt

Quick Summary:
==============
Open ports:
22/tcp open  ssh
80/tcp open  http
443/tcp open  https

Operating System Detection:
OS: Linux 3.2 - 4.9

To view full results: cat results/scanme.nmap.org_20230515_123456_scan.txt
```

## Project Structure

```
dal-scanner/
├── README.md
├── scan.sh
├── advanced_scan.sh
├── results/
│   ├── txt/
│   │   └── [targetname]_[timestamp].txt
│   ├── xml/
│   │   └── [targetname]_[timestamp].xml
│   └── html/
│       └── [targetname]_[timestamp].html
└── LICENSE
```

## Security and Ethical Use

This tool is provided for educational purposes and legitimate security testing only. Always ensure:

1. You have permission to scan the target network
2. You comply with all applicable laws and regulations
3. You use this tool responsibly and ethically

Unauthorized scanning of networks may be illegal and unethical.

## Advanced Usage Options (Future Enhancements)

- HTML report generation
- Email notifications upon scan completion
- Additional scan types
- Multi-target scanning
- Custom scan profiles

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- The Nmap Security Scanner team (https://nmap.org/)
- Contributors to this project
