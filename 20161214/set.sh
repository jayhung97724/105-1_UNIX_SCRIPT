#!/bin/bash
filename="$1"
set `ls -il $filename`
inode="$1"
size="$6"
echo -e "Name\tInode\tSize"
echo
echo -e "$filename\t$inode\t$size"
exit 0

