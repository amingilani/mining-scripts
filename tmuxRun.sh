#!/bin/bash
# Run like curl url | bash -s $address

cd
git clone https://gist.github.com/3a2c35a0e12dea88d48b6d8e6a621cee.git scripts
tmux new -s runner
cat scripts/createWorker.sh | bash -s $1
tmux detach