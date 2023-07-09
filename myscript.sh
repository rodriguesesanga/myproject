#!/usr/bin/env bash

HOST_INPUT=$1
host=(${HOST_INPUT//:/ })
echo "HOST : ${host[0]}" > script.log
echo "PATH : ${host[1]}" >> script.log

local_dir=$2
echo "LOCAL DIR : ${local_dir}" >> script.log

STORAGE=$3
storage=(${STORAGE//:/ })
echo "STORAGE ACCOUNT : "${storage[0]}"" >> script.log
echo "CONTAINER : ${storage[1]}" >> script.log

#Get files from VM to local
scp $1/./*.conf $2 >> script.log


#Create tarball in local machine
#IF [[ -z confiles.tar]] then,
name=$(date '+%Y-%m-%d_%H-%M-%S%z') >> script.log
tar -zcvf configure_files/confiles-$name.tar.gz $local_dir/ >> script.log

#Upload tarball in Storage AZURE
# shellcheck disable=SC2016
.\azcopy_windows_amd64_10.19.0\azcopy.exe copy 'configure_files/confiles-$name.tar.gz' 'https://$storage[0].blob.core.windows.net/$storage[1]/confiles-$name.tar.gz' >> script.log

