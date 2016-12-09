Lazy Zcash Mining
-----------------

This is my really lazy Zcash mining script. It uses Nice Hash across all available CPUs.
To start, simply copy the following cloud-config script to your new instance and run it.

```yaml
#cloud-config

# replace $url with the raw public url for initialize.sh
# replace $address with your zcash address
# replace $host and $port with the host and port of your papertrail log destination
runcmd:
 - GIST_URL=https://gist.githubusercontent.com/amingilani/3a2c35a0e12dea88d48b6d8e6a621cee/raw/initialize.sh
 - curl $GIST_URL | bash -s $address $host $port
 ```