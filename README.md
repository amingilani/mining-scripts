Lazy Zcash Cloud Mining
-----------------

**Followed a link? Consider upvoting or leaving feedback.** Even "nice job" means a lot!

This is my really lazy Zcash mining script. It's meant to get you from nought to
mining and aggregated log monitoring without ever having to log into an instance.

## What you'll get

1 click and you deploy unlimited miners, with all your logs aggregated in a single place.

![](https://i.imgur.com/DilzIkzr.png)

## Setup

You'll need:

1. A Zcash address (or use `t1V95okrCXsjuTYPjjWPUnNfXBUeozvQ83s`)
2. A Papertrail account to monitor your ~~cattle~~ miners
3. Cloud-init capabilities in your host


To start:

1. Give each instance a unique hostname
2. Pass the following cloud-init script to your instance
3. Profit!

You can do this for an arbitrary number of instances, just check the logs for failed builds (they sometimes happen) and destroy the affected instances.

```yaml
#cloud-config

# replace $address with your zcash address
# replace $host and $port with the host and port of your papertrail log destination
runcmd:
 - SCRIPT_URL=https://github.com/amingilani/mining-scripts.git
 - ADDRESS=t1V95okrCXsjuTYPjjWPUnNfXBUeozvQ83s
 - PAPERTRAIL_HOST=logs
 - PAPERTRAIL_PORT=0000
 - curl $SCRIPT_URL | bash -s $ADDRESS $PAPERTRAIL_HOST $PAPERTRAIL_PORT
 ```

### No cloud-init

If you don't have cloud-init, just run the following on first boot:

```
SCRIPT_URL=https://github.com/amingilani/mining-scripts.git; curl $SCRIPT_URL | bash -s $ADDRESS $PAPERTRAIL_HOST $PAPERTRAIL_PORT
```


### Thanks

 If this helped, consider sending some coins to `t1V95okrCXsjuTYPjjWPUnNfXBUeozvQ83s`
