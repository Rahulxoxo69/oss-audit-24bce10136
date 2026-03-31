#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Rahul | Course: Open Source Software
# This script goes through some important system folders
# and shows who owns them, what permissions they have,
# and how much space they take up. Also checks git config files.

# the folders we want to look at
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================"
echo "  Disk and Permission Auditor"
echo "========================================"
echo ""

# table header so the output looks clean
printf "%-15s %-15s %-10s %-10s %s\n" "Directory" "Permissions" "Owner" "Group" "Size"
printf "%-15s %-15s %-10s %-10s %s\n" "---------" "-----------" "-----" "-----" "----"

# go through each folder in the list
for DIR in "${DIRS[@]}"; do
    # make sure the folder actually exists first
    if [ -d "$DIR" ]; then
        # use ls and awk to pull out the info we need
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        # get the size, hide errors if we dont have permission
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        printf "%-15s %-15s %-10s %-10s %s\n" "$DIR" "$PERMS" "$OWNER" "$GROUP" "$SIZE"
    else
        printf "%-15s %s\n" "$DIR" "[does not exist]"
    fi
done

echo ""

# now lets check the git specific stuff
echo "--- Git Config Files ---"
echo ""

# system wide git config
if [ -f "/etc/gitconfig" ]; then
    PERMS=$(ls -l /etc/gitconfig | awk '{print $1}')
    echo "  /etc/gitconfig found (Permissions: $PERMS)"
else
    echo "  /etc/gitconfig not found (no system wide config set up)"
fi

# user level git config
if [ -f "$HOME/.gitconfig" ]; then
    PERMS=$(ls -l "$HOME/.gitconfig" | awk '{print $1}')
    echo "  ~/.gitconfig found (Permissions: $PERMS)"
else
    echo "  ~/.gitconfig not found"
fi

# git core folder where helper programs live
GIT_CORE="/usr/lib/git-core"
if [ -d "$GIT_CORE" ]; then
    SIZE=$(du -sh "$GIT_CORE" 2>/dev/null | cut -f1)
    PERMS=$(ls -ld "$GIT_CORE" | awk '{print $1}')
    echo "  $GIT_CORE found (Permissions: $PERMS, Size: $SIZE)"
else
    echo "  $GIT_CORE not found"
fi

echo ""
echo "========================================"
