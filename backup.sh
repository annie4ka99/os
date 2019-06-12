#!/bin/bash
backupReport="$HOME/backup-report"
[ -f "$backupReport" ] || touch $backupReport

lastBackupDate=$(ls $HOME | grep -E "^Backup-" | sort -n | tail -1 | cut -f 2- -d "-")
lastBackupDir="Backup-$lastBackupDate"
lastDateSeconds=$(date -d "$lastBackupDate" "+%s")

curDate=$(date "+%F")
curDateSeconds=$(date -d "$curDate" "+%s")

dif=8
[ -z "$lastBackupDate" ] || let dif=($curDateSeconds-$lastDateSeconds)/60/60/24

src="$HOME/source"
[ -d "$src" ] || 
{
	echo "there is no source directory"
	exit
}

if [[ $dif -gt 7 ]]
then
	dir="$HOME/Backup-$curDate"
	mkdir $dir
	echo "directory $dir was created" >> $backupReport
	
	for file in $(ls $src)
	do
		cp -r $src/$file $dir
		echo "$file copied" >> backupReport
	done
else
	dir=$lastBackUpDir
	for file in $(ls $src)
	do
		if [ -f "$dir/$file" ]
		then
			curSize=$(wc -c <"$dir/$file")
			lastCopySize=$(wc -c <"$src/$file")
			if [[ $curSize -ne $lastCopySize ]] 
			then
				mv "$dir/$file" "$dir/$file.$curDate"
				cp -r $src/$file $dir
				changedFilesInf="$changedFilesInf$file $file.$curDate\n"
			fi
		else
			cp -r $src/$file $dir
			filesInf="$filesInf$file\n"
		fi
	done
	echo -e "directory $lastBackupDir updated on $curDate" >> backupReport
	[ "$filesInf" ] && echo -e "files copied:\n$filesInf" >> $backupReport
	[ "$changedFilesInf" ] && echo -e "files updated:\n$changedFilesInf" >> $backupReport
fi
