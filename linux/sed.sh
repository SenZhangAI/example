#!/usr/bin/env bash


## TODO
base_dir=$(dirname "${BASH_SOURCE[0]}")

edo() {
    printf "\\033[0;34m%s\\033[0m\\n" "$*" 1>&2
    "$@" || exit 2
}

doc() {
    printf "# %s:\n" "$*" 1>&2
}

cmd() {
    printf "\\033[0;34m%s\\033[0m\\n" "$*" 1>&2
}

doc "Insert text in TEXT.txt to file.txt after RegexPattern"
cmd sed -iE '/RegexPattern/r TEXT.txt' file.txt
edo sed -i '/aaa/r TEXT.txt' file.txt
