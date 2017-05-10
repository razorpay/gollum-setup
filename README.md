# gollum-setup

Scripts to help you setup gollum. See our [blog post][blog] for more details on this setup.

See the [Gollum via Docker][docker] post on the Gollum wiki as well.

Steps to get this working:

## Get Gollum running via Docker:

```bash
git clone git@github.com:razorpay/gollum-setup.git
cd gollum-setup
docker build -t gollum .
mkdir -p ~/wiki
cd ~/wiki
git init
docker run -v /`pwd`:/wiki -p 4567:80 gollum
```

## Now run the oauth2_proxy:

```bash
cp oauth2_proxy.cfg /etc/oauth2_proxy.cfg
# Edit the configuration as per your requirement
vim /etc/oauth2_proxy.cfg
# Add more steups here
```

## Now setup nginx:

(TODO)

## And viola, you should have it working

(TODO)

[docker]: https://github.com/gollum/gollum/wiki/Gollum-via-Docker
[blog]: https://razorpay.com/blog/TODO
