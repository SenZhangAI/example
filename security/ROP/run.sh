#!/usr/bin/env bash

echo "test stackoverflow, run in Linux..."


edo () {
    echo "RUN: $*"
    $@
}

echo "-fno-stack-protector:  close DEP"
echo "-z execstack close Stack Protector"
edo gcc -fno-stack-protector -z execstack -o stackoverflow.exe stackoverflow.c
