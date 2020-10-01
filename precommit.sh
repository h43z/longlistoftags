#!/bin/sh
# *.js
for file in *.txt; do
	jsfile="$(basename $file .txt)".js
	echo "const tags = [" > $jsfile
	while read tag;do
		echo '  "'$tag'"', >> $jsfile
	done < $file
	echo "]" >> $jsfile
done

# readme.md
echo "# long list of tags" > README.md
cat all.txt | while read line; do
	echo "$line  " >> README.md
done
