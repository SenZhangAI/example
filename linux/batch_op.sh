#!/usr/bin/env bash

# batch add suffix
for i in * ; do echo mv $i $i".txt" ; done;

# batch remove suffix
for i in *.bak; do echo mv $i ${i%.*}; done;
# or
for i in $(find *.bak); do echo mv $i ${i%.*}; done;
