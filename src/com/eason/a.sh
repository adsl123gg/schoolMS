#!/usr/bin/sh

ls | while read line
do
	if [ -d $line ] ;then
		cd ./$line;
		wc -l *$1 | while read l
		do
			echo $l | sed -n '/java/p' | sed 's/ .*//g' ;
		done
		cd ../;
	fi
	
done
