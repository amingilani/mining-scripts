#!/bin/bash
# Run like curl url | bash -s $address $host $port

# log all this output
exec 1> >(logger -s -t $(basename $0)) 2>&1

# setup remote logging
print "setup remote logging"
echo "*.*          @$2.papertrailapp.com:$3'" >> /etc/rsyslog.conf
sudo service rsyslog restart

# regular maintenance
print "performing upgrades"
sudo apt-get update && sudo apt-get upgrade -y

# go home
cd

# execute the real script
print "running worker"
git clone https://gist.github.com/3a2c35a0e12dea88d48b6d8e6a621cee.git scripts
tmux new -s runner
cat scripts/createWorker.sh | bash -s $1
tmux detach