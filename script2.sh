#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Rahul | Course: Open Source Software
# This script checks if a package is installed on your system
# and tells you a bit about it plus a fun fact about the project

# the package to check, defaults to git if you dont give one
PACKAGE=${1:-"git"}

echo "========================================"
echo "  FOSS Package Inspector"
echo "========================================"
echo ""
echo "Looking for package: $PACKAGE"
echo ""

# first we need to figure out if this is a debian or redhat system
# then check if the package is there
if command -v dpkg &>/dev/null; then
    # this is a debian based system so we use dpkg
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        echo "[INSTALLED] $PACKAGE is on this system."
        echo ""
        # show some details about the package
        dpkg -s "$PACKAGE" 2>/dev/null | grep -E 'Version|Description|Homepage'
    else
        echo "[NOT FOUND] $PACKAGE is not installed."
        echo "You can install it with: sudo apt install $PACKAGE"
    fi
elif command -v rpm &>/dev/null; then
    # this is a redhat based system so we use rpm
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "[INSTALLED] $PACKAGE is on this system."
        echo ""
        # show version and license info
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
    else
        echo "[NOT FOUND] $PACKAGE is not installed."
        echo "You can install it with: sudo dnf install $PACKAGE"
    fi
else
    echo "Error: could not find dpkg or rpm on this system."
    exit 1
fi

echo ""

# a case statement to print a little note about each tool
# just some fun background on why these projects matter
case "$PACKAGE" in
    git)
        echo "Fun fact: Git was made by Linus Torvalds in 2005"
        echo "because the proprietary tool they were using got"
        echo "taken away. He built it in like two weeks."
        ;;
    httpd|apache2)
        echo "Fun fact: Apache was made by volunteers and it"
        echo "ended up being more reliable than most paid options."
        echo "It ran a huge chunk of the early internet."
        ;;
    mysql*|mariadb*)
        echo "Fun fact: MySQL showed that open source databases"
        echo "could go head to head with expensive ones like Oracle."
        echo "MariaDB came about when the community forked it to"
        echo "keep it truly open."
        ;;
    firefox)
        echo "Fun fact: Firefox is backed by a nonprofit trying"
        echo "to keep the web open for everyone. Pretty cool for"
        echo "a browser."
        ;;
    vlc)
        echo "Fun fact: VLC was started by university students"
        echo "in Paris who just wanted a video player that worked."
        echo "Now it plays basically anything on any platform."
        ;;
    python*)
        echo "Fun fact: Python was built with beginners in mind."
        echo "The whole community shaped it to be easy to read"
        echo "and welcoming to new people."
        ;;
    *)
        echo "No fun fact for $PACKAGE, sorry."
        echo "Try: git, httpd, mysql, firefox, vlc, or python3"
        ;;
esac

echo ""
echo "========================================"
