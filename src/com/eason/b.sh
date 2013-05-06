#!/usr/bin/sh
n=0;
./a.sh $1>t;
while read l
do
	n=$(( $l + $n ));
done<t;

echo $n;
rm -f t;
