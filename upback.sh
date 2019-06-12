#!/bin/bash
lastBackupDate=$(ls | grep -E "^Backup-" | sort -n | tail -1 | cut -f 2- -d "-")
[ "$lastBackupDate" ] ||
{
	echo "there is no any backup directory"
	exit
}
backupDir="$HOME/Backup-$lastBackupDate"
[ -d $HOME/restore ] || mkdir $HOME/restore
for file in $(ls "$backupDir" | grep -E -v ".[0-9]{4}-[0-9]{2}-[0-9]{2}$")
do
	cp -r "$backupDir/$file" "$HOME/restore"
done
