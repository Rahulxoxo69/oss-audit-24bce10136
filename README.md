# Open Source Software Audit: Git

Hey! I'm Rahul, and this repository contains my Capstone Project for the Open Source Software (OSS) course. 

The main focus of this project was to do a deep dive into the **Git Version Control System**—figuring out why Linus Torvalds built it, how its GPL v2 license works, its footprint on Linux systems, and how it compares to older, closed-source tools.

## The Shell Scripts
I wrote five separate scripts to demonstrate different Bash concepts like loops, arrays, system commands, and file I/O. They are all meant to be run on a Linux terminal (I tested them on a standard Debian/Ubuntu environment).

### 1. `script1.sh`: System Identity Report
A quick script that uses command substitution to gather info about your current Linux environment (kernel version, uptime, distribution) and formats it into a neat little report.
> **Run it:** `./script1.sh`

### 2. `script2.sh`: FOSS Package Inspector
This one takes a package name (defaults to `git`), detects if you are using `dpkg` (Debian) or `rpm` (RedHat), and checks if it's installed. It also uses a `case` statement to print a customized "fun fact" about common open-source tools.
> **Run it:** `./script2.sh git`

### 3. `script3.sh`: Disk and Permission Auditor
Uses a bash array and a `for` loop to check out important system folders (like `/etc` and `/var/log`). It reports who owns them, what the permissions are, and how much disk space they take up. It also checks if your specific Git config files exist.
> **Run it:** `./script3.sh`

### 4. `script4.sh`: Log File Analyzer
A handy script to comb through log files. You pass it a file path and a keyword (like "error"). It reads the file line by line, counts the matches, and prints the last 5 relevant lines so you don't have to scroll through everything.
> **Run it:** `./script4.sh /var/log/syslog error`

### 5. `script5.sh`: Open Source Manifesto Generator
An interactive script! It asks you three questions about what "freedom" means to you and what kind of tools you use, and then generates a personalized open-source manifesto saved in a `.txt` file using output redirection.
> **Run it:** `./script5.sh`

## How to use
If you want to try running any of the scripts yourself, just clone this repository, make the scripts executable, and run them:

```bash
git clone https://github.com/Rahulxoxo69/oss-audit-24bce10136
cd oss-audit-24bce10136
chmod +x *.sh
./script1.sh
```

## About
- **Name:** Rahul G
- **Registration Number:** 24BCE10136
- **Course:** Open Source Software (OSS)

