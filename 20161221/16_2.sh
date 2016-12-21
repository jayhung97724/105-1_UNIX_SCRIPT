#!/bin/sh
directory=$1
find $1 -type f \( -name "*.o" -o -name "*.ps" -o -name "*.jpg" \) -print|xargs rm
