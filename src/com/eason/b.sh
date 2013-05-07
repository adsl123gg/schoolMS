#!/usr/bin/sh
n=0;
./a.sh >t;
while read l
do
	n=$(( $l + $n ));
done<t;

echo $n;
rm -f t;
