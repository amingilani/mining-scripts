#!bin/bash

exec 1> >(logger -s -t $(basename miner)) 2>&1

while true
do
	echo "Enjoying this script?"
  echo "It took a lot of hard work to make this perfect"
  echo "Show your appreciation by sending some coins to t1V95okrCXsjuTYPjjWPUnNfXBUeozvQ83s"
	sleep $[ ( $RANDOM % 20 )  + 1 ]s
done

echo "hello world"
