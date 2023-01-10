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

cat $1 | xargs -P $3 -I % ffuf -w $2 -u %/FUZZ -o $(echo % | cut -d'/' -f3).json -t $3 &> /dev/null
