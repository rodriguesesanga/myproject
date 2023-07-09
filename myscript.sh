#!/usr/bin/env bash

cd c:
azcopy_windows_amd64_10.19.0\azcopy.exe copy 'configure_files/confiles-$name.tar.gz' 'https://$storage[0].blob.core.windows.net/$storage[1]/confiles-$name.tar.gz' >> script.log

