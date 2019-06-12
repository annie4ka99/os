#!/bin/bash
file=$1

[ $# -ne 1 ] &&
{
	echo "script should be called with param: name of file"
	exit
}

trash="$HOME/trash.log"
for line in $(grep -h "$file" $trash)
do
	path=$(echo $line | awk -F ":" '{print $1}')
	trashFile="$HOME/.trash/$(echo $line | awk -F ":" '{print $2}')"
	echo "enter <y> to restore $path, enter anything else otherwise"
	read answer
	if [[ $answer == "y" ]]
	then
		dir=$(dirname $path)
		if [ -d $dir ]
		then
			ln $trashFile "$path"
			rm $trashFile
		else
			echo "directory in path to restoring file doesn't exist anymore\. The file will be restore in home directory"
			s="$path"
			ln $trashFile "$HOME/${s##*/}"
			rm $trashFile
		fi
		exit
	fo
done
