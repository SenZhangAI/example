#!/usr/bin/env bash

base_dir=$(dirname "${BASH_SOURCE[0]}")

edo() {
    printf "\\033[0;34m%s\\033[0m\\n" "$*" 1>&2
    "$@" || exit 2
}

# search text in multiline`
# seach text between START .. END (include START END)
edo perl -ne "print if /^START$/../^END$/" $base_dir/test/test.txt
# search text not between START .. END
edo perl -ne "print unless /^START$/../^END$/" $base_dir/test/test.txt
