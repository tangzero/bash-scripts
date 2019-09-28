#!/bin/bash

function show_ps_count() {
	count=`ps aux | wc -l`
	echo "Process count: $count"
}

function show_users() {
	echo "User running a process"
	ps aux | cut -d " " -f1 | sort | uniq | head -n -1
}

function kill_process() {
	read -p "Which process do you wanna kill? " pid
	kill -9 $pid
}

show_ps_count
show_users
kill_process
