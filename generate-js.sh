#!/bin/sh
for file in *.txt; do
	jsfile="$(basename $file .txt)".js
	echo "const tags = [" > $jsfile
	while read tag;do
		echo '  "'$tag'"', >> $jsfile
	done < $file
	echo "]" >> $jsfile
done

