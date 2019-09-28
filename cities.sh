#!/bin/bash

clear
echo "Countries and Cities"
echo "--------------------"

for line in `cat cities.txt`; do
	country=`echo $line | cut -d ":" -f1`
	city=`echo $line | cut -d ":" -f2`

	echo "La capital de $country es $city"
done
read
