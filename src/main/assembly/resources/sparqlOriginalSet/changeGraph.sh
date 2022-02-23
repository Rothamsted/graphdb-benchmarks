#!/bin/bash
for i in *.sparql; do 
	sed -i 's,FROM <.*>,FROM <'"$1"'>,' $i
done

for i in *_"$2"_clean.csv; do 
	echo $i 
	echo ` echo $i | sed "s/_$2_clean.csv/.csv/"`
	cp $i `echo $i | sed "s/_$2_clean.csv/.csv/"`
	diff $i  `echo $i | sed "s/_$2_clean.csv/.csv/"`
done
