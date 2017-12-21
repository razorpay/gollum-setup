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

You can pass it the following environment variables:

```
CLIENT_ID=
CLIENT_SECRET=
PROVIDER=google
EMAIL_DOMAIN=razorpay.com
REDIRECT_URL=
GIT_REMOTE_URL=
COOKIE_SECRET=
```

If you have a reverse proxy, use REDIRECT_URL to pass the complete HTTPS URL. If the `GIT_REMOTE_URL` is setup, and the `/wiki` directory is not a valid git repository, it automatically clones the given repo.

## GitHub

If you have GIT_REMOTE_URL setup, make sure that either the repo is read-world, or you mount the correct `id_rsa` and `id_rsa.pub` files in the `/root/.ssh` directory.

## License

The very little code in this repository is licensed under MIT.

[docker]: https://github.com/gollum/gollum/wiki/Gollum-via-Docker
[blog]: https://razorpay.com/blog/TODO
