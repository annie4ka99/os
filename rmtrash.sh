#!/bin/bash
script=$1

[ $# -ne 1 ] &&
{
	echo "script should be called with param: name of file"
	exit
}

[ -d "$script" ] &&
{
	echo "it's a directory, not a file"
	exit
}

[ -e "$PWD/$script" ] ||
{
	echo "there is no such file in current directory"
	exit
}

[ -e $HOME/num ] ||
{
	touch $HOME/num
	echo "0" > $HOME/num
}
name="$(cat $HOME/num)"

trashDir=$HOME/.trash
logFile=$HOME/trash.log

[ -e $trashDir ] || mkdir $trashDir
[ -e $logFile ] || touch $logFile

ln $script "$trashDir/$name"
rm "$script"
echo "$PWD/$script:$name" >> $logFile

let name=$name+1
echo $name > $HOME/num
