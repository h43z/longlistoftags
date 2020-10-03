#!/bin/sh

cat all.txt math.txt svg.txt html.txt | awk '{print tolower($0)}' | sort -u > all.txt

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
echo "# long list of $(wc -l all.txt | cut -d" " -f1) tags" > README.md
echo "write new found tag in correct .txt (html,svg,math) file and run \`precommit.sh\`\n" >> README.md
cat all.txt | while read line; do
	echo "$line  " >> README.md
done
