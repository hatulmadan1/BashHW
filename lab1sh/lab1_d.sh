#!/bin/bash
if [ $# -eq 0 ] 
then 
 echo WRONG NUMBR OF ARGUMENTS
 exit 
fi

format=$1
substring=$2

ls -a -R $PWD | grep "\.$format$" | xargs grep -l "$substring" 


