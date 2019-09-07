#!/bin/bash

clear

read -p "Directory name: " dir_name

if [[ -d $dir_name ]]; then
	echo "Failed to create directory $dir_name. Directory already exist!"
	exit 1
fi

mkdir $dir_name
echo "Directory $dir_name successful created!"

