#!/bin/sh
user=$1
set `grep ^$1 /etc/passwd`

if line=$(grep "^$user:" /etc/passwd); then
home=$(echo "$line" | cut -d: -f6)
shell=$(echo "$line" | cut -d: -f7)
echo "Home directory: $home"
echo "Shell: $shell"
else
echo "user '$user' not found" >&2
exit 1
fi
