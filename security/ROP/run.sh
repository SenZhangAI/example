#!/usr/bin/env bash

echo "test stackoverflow, run in Linux..."
# -fno-stack-protector 关闭 DEP
# -z execstack 关闭Stack Protector
gcc -fno-stack-protector -z execstack -o stackoverflow stackoverflow.c
