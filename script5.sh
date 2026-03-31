#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Rahul | Course: Open Source Software
# This script asks you 3 questions about open source
# and then writes a little manifesto for you and saves it
#
# Tip: you can make a shortcut for this by adding
#   alias manifesto='bash /path/to/script5.sh'
# to your ~/.bashrc file, then just type 'manifesto' to run it

echo "========================================"
echo "  Open Source Manifesto Generator"
echo "========================================"
echo ""
echo "Just answer these three quick questions."
echo ""

# ask the user some questions
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# grab the date and username
DATE=$(date '+%d %B %Y')
USERNAME=$(whoami)

# set up the output file name
OUTPUT="manifesto_${USERNAME}.txt"

# write the manifesto to the file
# using > to create the file, then >> to keep adding to it
echo "============================================" > "$OUTPUT"
echo "  My Open Source Manifesto" >> "$OUTPUT"
echo "  Written on $DATE by $USERNAME" >> "$OUTPUT"
echo "============================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I think open source software is really important." >> "$OUTPUT"
echo "Every day I use $TOOL, which was built by a bunch" >> "$OUTPUT"
echo "of people who decided to share their work with" >> "$OUTPUT"
echo "everyone for free. To me, freedom means $FREEDOM," >> "$OUTPUT"
echo "and that is basically what open source is about:" >> "$OUTPUT"
echo "being free to use, look at, change, and share" >> "$OUTPUT"
echo "the tools we all depend on." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "If I could make one thing and give it to the world" >> "$OUTPUT"
echo "for free, it would be $BUILD. I think the best" >> "$OUTPUT"
echo "software is not made behind locked doors. It is" >> "$OUTPUT"
echo "made out in the open by people who think tools and" >> "$OUTPUT"
echo "knowledge should be for everyone." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Open source is not just about licenses and rules." >> "$OUTPUT"
echo "It is a way of thinking about how we should build" >> "$OUTPUT"
echo "things together." >> "$OUTPUT"
echo "============================================" >> "$OUTPUT"

echo ""
echo "Done! Your manifesto is saved to: $OUTPUT"
echo ""
echo "--- Here is what it looks like ---"
cat "$OUTPUT"
