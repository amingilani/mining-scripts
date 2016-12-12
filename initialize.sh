#!/bin/bash
# Run: curl https://gist.githubusercontent.com/amingilani/3a2c35a0e12dea88d48b6d8e6a621cee/raw/initialize.sh | bash -s $address $host $port

# log all this output
exec 1> >(logger -s -t $(basename initialize)) 2>&1

# setup remote logging
echo "setup remote logging"
echo "*.*          @$2.papertrailapp.com:$3'" >> /etc/rsyslog.conf
sudo service rsyslog restart

# regular maintenance
echo "performing upgrades"
sudo apt-get update && sudo apt-get upgrade -y

# install dependencies
sudo apt-get install -y git tmux

# go home
cd

# execute the real script
echo "running worker"
git clone https://gist.github.com/3a2c35a0e12dea88d48b6d8e6a621cee.git scripts
tmux new-session -d "cat scripts/miner.sh | bash -s $1"
