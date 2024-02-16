#!/bin/bash


# Define color variables
blue="\e[1;34m"
red="\e[1;31m"
green="\e[1;32m"
yellow="\e[1;33m"
reset="\e[0m"

# Define line
bottom_line="----------------------------------------------------------------------------------------------------"

# Check if a filename is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File $filename not found."
    exit 1
fi
# Perform the operation on the input file
echo -e "\n"

echo -e "$red(jmp|call) $reset"
egrep '(jmp|call) esp;' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"


echo -e "$red(mov)$reset"
egrep 'mov e.., \[e..\];' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
egrep 'mov \[e..\], e..;' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
egrep 'mov e.., e..;' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"


echo -e "$red(xchg)$reset"
egrep 'xchg e.., e..;' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"

echo -e "$red(push)$reset"
egrep 'push e..;.*pop e..;' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"

echo -e "$red(inc)$reset"
egrep 'inc e..;' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"

echo -e "$red(dec)$reset"
egrep 'dec e..;' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"

echo -e "$red(neg)$reset"
egrep 'neg e..;' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"

echo -e "$red(push)$reset"
egrep 'push e..;' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"

echo -e "$red(pop)$reset"
egrep 'pop e..;' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"

echo -e "$red(pushad)$reset"
egrep 'pushad;' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"

echo -e "$red(and)$reset"
egrep 'and e.., (e..|0x.+?);' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"

echo -e "$red(xor)$reset"
egrep 'xor e.., (e..|0x.+?);' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"

echo -e "$red(add)$reset"
egrep 'add e.., (e..|0x.+?);' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"

echo -e "$red(sub)$reset"
egrep 'sub e.., (e..|0x.+?);' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"

echo -e "$red(lea|mov|and)$reset"
egrep '(lea|mov|and) \[?e..\]?, 0;' $filename | awk '{ print length, $0 }' | sort -n -s -r | cut -d' ' -f2- | tail
echo -e "$blue$bottom_line$reset"

