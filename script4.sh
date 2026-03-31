#!/bin/bash
# Script 4: Log File Analyzer
# Author: Rahul | Course: Open Source Software
# This script reads through a log file and counts how many
# lines have a certain keyword in them (like "error")
# Usage: ./script4.sh /path/to/logfile [keyword]

# get the file and keyword from command line, default keyword is "error"
LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

echo "========================================"
echo "  Log File Analyzer"
echo "========================================"
echo ""

# make sure the user actually gave us a file
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# check if the file is actually there
if [ ! -f "$LOGFILE" ]; then
    echo "Error: could not find '$LOGFILE'"
    exit 1
fi

# check if the file has anything in it
if [ ! -s "$LOGFILE" ]; then
    echo "Heads up: '$LOGFILE' is empty."
    echo "Waiting 2 seconds and trying again..."
    sleep 2
    # try one more time (this is like a do-while retry)
    if [ ! -s "$LOGFILE" ]; then
        echo "Still empty. Nothing to look at."
        exit 1
    fi
fi

echo "Looking at: $LOGFILE"
echo "Searching for: $KEYWORD (not case sensitive)"
echo ""

# read through the file one line at a time and count matches
while IFS= read -r LINE; do
    # check if this line has our keyword (case insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# show what we found
echo "Results:"
echo "  Total lines in file : $(wc -l < "$LOGFILE")"
echo "  Lines with '$KEYWORD' : $COUNT"
echo ""

# show the last 5 lines that matched
if [ "$COUNT" -gt 0 ]; then
    echo "Last 5 lines that matched:"
    echo "------------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
    echo "------------------------"
else
    echo "Did not find any lines with '$KEYWORD' in them."
fi

echo ""
echo "========================================"
