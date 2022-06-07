#!/bin/bash

## main 

if [[ $# -ne 0 ]];then
    echo "usage $0"
    echo "no argument"
fi

# variables
bash_file_name=$0
project_name=task_management
tarball_name=${project_name}_backup.tar.gz
storage_folder_path=

# get the root of project
while true; do
    folder_name=$(basename $(pwd))

    if [[ ${folder_name} == ${project_name} ]]; then
        target_folder_path=$(realpath .)
        storage_folder_path=$(realpath ..)
        break
    elif [[ ${folder_name} == "/" ]]; then
        return -2
    else
        cd ..
    fi

done

# display arguments
echo ""
printf "%-10s: %s\n" "bash file name" ${bash_file_name}
printf "%-10s: %s\n" "target folder path" ${target_folder_path}
printf "%-10s: %s\n" "storage folder path" ${storage_folder_path}
echo ""

# tarball process
echo "tar czvf ../${tarball_name} ${target_folder_path}" 
tar czvf ../${tarball_name} ${target_folder_path}






