# gollum-setup

Scripts to help you setup gollum. See our [blog post][blog] for more details on this setup.

See the [Gollum via Docker][docker] post on the Gollum wiki as well.

Steps to get this working:

## 1. Setup configuration

1. Copy `env.sample` to `env.list`
2. Edit values in `env.list`. See Configuration section below for what everything does.

## 2. Run docker 

```sh
# Replace this with your own git wiki
git clone https://github.com/razorpay/gollum-setup.wiki.git
cd gollum-setup
docker pull razorpay/gollum
docker run -v /`pwd`:/wiki -p 4567:80 --env-file env.list razorpay/gollum
```

If you'd like to setup a reverse proxy for TLS, you'll have to do that on your own for now.

## Configuration

```
EMAIL_DOMAIN=example.com (The google apps domain)
REDIRECT_URL=https://wiki.example.com/oauth2/callback
```

If you have a reverse proxy, use REDIRECT_URL to pass the complete HTTPS Url.

## License

The very little code in this repository is licensed under MIT.


[docker]: https://github.com/gollum/gollum/wiki/Gollum-via-Docker
[blog]: https://razorpay.com/blog/TODO
