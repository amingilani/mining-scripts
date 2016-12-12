Lazy Zcash Cloud Mining
-----------------

**Followed a link? Consider upvoting or leaving feedback.** Even "nice job" means a lot!

This is my really lazy Zcash mining script. It's meant to get you from nought to
mining and aggregated log monitoring without ever having to log into an instance.

## What you'll get

1 click to deploy, and all your miner logs are aggregated in a single place.

![](https://i.imgur.com/DilzIkzr.png)

### Specs

* Miner: [nheqminer](https://github.com/nicehash/nheqminer)
* Pool: [flypool](https://zcash.flypool.org)

## Setup

You'll need:

1. A Zcash address (or use `t1V95okrCXsjuTYPjjWPUnNfXBUeozvQ83s`)
2. A Papertrail account to monitor your ~~cattle~~ miners
3. Ubuntu instances (tested on 14.04 & 16.04)
3. Optional: cloud-init capabilities in your host


To start:

1. Give each instance a unique hostname (this will be your worker name)
2. Pass the following cloud-init script to your instance
3. Profit!

You can do this for an arbitrary number of instances, just check the logs for failed builds (they sometimes happen) and destroy the affected instances.

```yaml
#cloud-config

# replace $address with your zcash address
# replace $host and $port with the host and port of your papertrail log destination
runcmd:
 - SCRIPT_URL=https://raw.githubusercontent.com/amingilani/mining-scripts/master/initialize.sh
 - ADDRESS=t1V95okrCXsjuTYPjjWPUnNfXBUeozvQ83s
 - PAPERTRAIL_HOST=logs5
 - PAPERTRAIL_PORT=00000
 - curl $SCRIPT_URL | bash -s $ADDRESS $PAPERTRAIL_HOST $PAPERTRAIL_PORT
```

### No cloud-init

If you don't have cloud-init, just run the following on first boot:

```
SCRIPT_URL=https://raw.githubusercontent.com/amingilani/mining-scripts/master/initialize.sh; curl $SCRIPT_URL | bash -s $ADDRESS $PAPERTRAIL_HOST $PAPERTRAIL_PORT
```


### Thanks

 If this helped, consider sending some coins to `t1V95okrCXsjuTYPjjWPUnNfXBUeozvQ83s`
