#!/bin/bash

function main() {
	clear

	filename=$1
	if [[ ! -e $filename ]]; then
		echo "Input file $filename do not exist!"
		exit 1
	fi

	cat $filename | while read user; do
		if [[ ! -z "$user" ]]; then
			create_user $user
		fi
	done
}

function create_user() {
	user=$1
	pass=$2
	useradd $user
	echo $pass | passwd $user --stdin
	echo "User $user successful created!"
}

# start the script
main $1
