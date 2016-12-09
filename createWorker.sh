#!/bin/bash
# Run like curl url | bash -s $address

# log all this output
exec 1> >(logger -s -t $(basename $0)) 2>&1

# fetch dependencies and build the miner
cd ~
sudo apt-get update && sudo apt-get -y install cmake build-essential libboost-all-dev
git clone -b Linux https://github.com/nicehash/nheqminer.git
cd nheqminer/cpu_xenoncat/Linux/asm/
sh assemble.sh
cd ../../../Linux_cmake/nheqminer_cpu
cmake .
make -j $(nproc)

# run it
print "running miner"
~/nheqminer/Linux_cmake/nheqminer_cpu/nheqminer -l us1-zcash.flypool.org:3333 -u $1.$(hostname)