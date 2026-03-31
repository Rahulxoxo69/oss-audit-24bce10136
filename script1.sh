#!/bin/bash
# Script 1: System Identity Report
# Author: Rahul | Course: Open Source Software
# This script just shows some basic info about your system
# like what Linux you are running, who is logged in, etc.

# setting up some variables
STUDENT_NAME="Rahul"
SOFTWARE_CHOICE="Git"

# grabbing system info using command substitution
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$(eval echo ~$USER_NAME)
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%d %B %Y, %I:%M %p')

# trying to figure out what Linux distro this is
if [ -f /etc/os-release ]; then
    DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d'"' -f2)
else
    DISTRO="Unknown Linux Distribution"
fi

# printing everything out in a nice format
echo "========================================"
echo "   Open Source Audit - $STUDENT_NAME"
echo "   Software: $SOFTWARE_CHOICE"
echo "========================================"
echo ""
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date/Time    : $CURRENT_DATE"
echo ""
echo "  License Note : This OS runs under the GNU General"
echo "                 Public License v2 (GPL v2), which"
echo "                 basically gives you four freedoms"
echo "                 to use, study, share, and modify it."
echo ""
echo "========================================"
