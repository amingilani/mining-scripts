Lazy Zcash Mining
-----------------

This is my really lazy Zcash mining script. It uses Nice Hash across all available CPUs.
To start, simply copy the following cloud-config script to your new instance and run it.

```yaml
#cloud-config

# replace $url with the raw public url for intialize.sh
# replace $address with your zcash address
# replace $host and $port with the host and port of your papertrail log destination
runcmd:
 - curl $url | bash -s $address $host $port
 ```