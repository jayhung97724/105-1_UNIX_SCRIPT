#!/bin/sh
filename=¡¨$1¡¨
if [ -f ¡§$filename¡¨ ]
	then	
		set -- `ls -l $filename`
		size=¡§$4¡¨
		if [ $size -eq 0 ]
		   then
			rm $filename
			exit 0
		   else
			linkcount=¡§$2¡¨
			owner=¡§$3¡¨
			date="$5 $6 at $7"
			echo "Name	$filename"
			echo "Size	$size"
			echo "LnkCnt	$linkcount"
			echo "Owner	$owner"
			echo "Date	$date"
			exit 0	
		   fi
	else
		echo ¡§$0 : $filename is not a simple file.¡¨
		exit 1
fi