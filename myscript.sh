#!/usr/bin/env bash

if [ "${4:-dry-run}" == "dry-run" ]; then
  echo "**** This dry-run mode ****" > script.log
  echo "1. GET INPUT:ARGUMENTS" >> script.log
  echo "2. GET .conf files from remote machine to local" >> script.log 
  echo "3. CREATE a tarball .tar.gz with .conf files retrieved" >> script.log
  echo "4. UPLOAD tarball generated in Storage Azure Account specified in INPUT" >> script.log
  echo "5. LOG FILE script.log is generated." >> script.log
else
  HOST_INPUT=$1
  host=(${HOST_INPUT//:/ })
  echo "HOST : ${host[0]}" >> script.log
  echo "PATH : ${host[1]}" >> script.log

  local_dir=$2
  echo "LOCAL DIR : ${local_dir}" >> script.log

  STORAGE=${3:-healthy:mycontainer}
  storage=(${STORAGE//:/ })
  echo "STORAGE ACCOUNT : "${storage[0]}"" >> script.log
  echo "CONTAINER : ${storage[1]}" >> script.log

  #Get files from VM to local
  scp $1/*.conf $2 && scp $1/**/*.conf $2 >> script.log


  #Create tarball in local machine
  name=$(date '+%Y-%m-%d_%H-%M-%S%z') >> script.log
  tar -zcvf configure_files/confiles-$name.tar.gz $local_dir/ >> script.log

  ../../../../../../azcopy_windows_amd64_10.19.0/azcopy.exe copy "configure_files/confiles-$name.tar.gz" "https://healthy.blob.core.windows.net/mycontainer?sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2023-07-11T05:07:52Z&st=2023-07-10T21:07:52Z&spr=https&sig=6dhKHEggRVRcrRVf3oOGHRidp0fs%2BAlAQ6CtHVRKYxg%3D" >> script.log
fi



