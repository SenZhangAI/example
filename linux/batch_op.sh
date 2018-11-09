#!/usr/bin/env bash
exit

# batch add suffix
for i in * ; do mv $i $i".txt" ; done;

# batch remove suffix
for i in *.bak; do mv $i ${i%.*}; done;
# or
for i in $(find *.bak); do mv $i ${i%.*}; done;
