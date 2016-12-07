#!/bin/bash

# Run like curl url | bash -s $username $worker

sudo apt-get update && sudo apt-get -y install cmake build-essential libboost-all-dev
git clone -b Linux https://github.com/nicehash/nheqminer.git
cd nheqminer/cpu_xenoncat/Linux/asm/
sh assemble.sh
cd ../../../Linux_cmake/nheqminer_cpu
cmake .
make -j $(nproc)
cd /root/nheqminer/Linux_cmake/nheqminer_cpu
./nheqminer_cpu -cd 0 -l zec.suprnova.cc:2142 -u $1.$2 -p YourWorkerPassword $2