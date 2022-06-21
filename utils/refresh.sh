#!/bin/bash

# source 
source default-variables

# function verbose message 
function VERBOSE(){
    if [[ ${VERBOSE_FLAG} == "y" ]]; then
        printf $@
    fi
}


## main 

while getopts 'vh' opt; do
    case "$opt" in
        v)
            echo "verbose mode"
            VERBOSE_FLAG=y
            ;;
        h|?)
            echo "Usage: $(basename $0) [-v] [-h]"
            echo "-v: verbose mode"
            echo "-h: help message"
            echo ""
            ;;
    esac
done

shift "$(($OPTIND -1))"

# initial csv
rm "${OUT_TASKTABLE}"
VERBOSE "%s,%s,%s,%s\n" "No." "Major_Num" "Minor_Num" "Expression"
printf "%s,%s,%s,%s\n" "No." "Major_Num" "Minor_Num" "Expression" >> "${OUT_TASKTABLE}"

#
count=1
for task_name in ${TOPDIR}/tasks/*
do
    task_name=${task_name##*tasks/}
    if [[ ${task_name} =~ [0-9]+-[0-9]+_* ]]; then
       major_num=$(echo $task_name | awk -F"[-_]" '{print $1}')
       minor_num=$(echo $task_name | awk -F"[-_]" '{print $2}')
       brief=${task_name#*_}

       #echo "task_name: ${task_name}"
       #echo "major num:${major_num}"
       #echo "minor num:${minor_num}"
       #echo "expression:${brief}"
       #echo ""

       VERBOSE "%s,%s,%s,%s\n" "$count" "$major_num" "$minor_num" "$brief" 
       printf "%s,%s,%s,%s\n" "$count" "$major_num" "$minor_num" "$brief" >> "${OUT_TASKTABLE}"

       count=$((count + 1))
    fi
done

