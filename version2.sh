#!/bin/bash

if [ $# -ne 3 ]; 
    then echo "[Syntax:] bash parffuf.sh <host.txt> <wordlist.txt> <rate>"
    exit
fi

echo "[File Name:] $1"
echo "[Wordlist:] $2"
echo "[Fuzz Rate:] $3 rps"
echo "[Mode:] Parallel"

echo

cat $1 | parallel -j $3 "ffuf -w $2 -u {1}/FUZZ -o $(echo {1} | cut -d'/' -f3).json &> /dev/null"
