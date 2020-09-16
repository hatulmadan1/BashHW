#!/bin/bash
if [ $# -eq 0 ] 
then 
 echo WRONG NUMBR OF ARGUMENTS
 exit 
fi

format=$1
substring=$2

mkdir lab1sh &> /dev/null

ls -a -R $PWD | grep "\.$format$" | xargs grep -l "$substring" | xargs -I '{}' mv '{}' ~/lab1sh


