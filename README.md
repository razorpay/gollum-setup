# gollum-setup

[![](https://images.microbadger.com/badges/image/razorpay/gollum:2.0.0.svg)](https://microbadger.com/images/razorpay/gollum:2.0.0) [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

Scripts to help you setup gollum. See our [blog post][blog] for more details on this setup.

See the [Gollum via Docker][docker] post on the Gollum wiki as well.

Steps to get this working:

## 1. Setup configuration

1.  Copy `env.sample` to `env.list`
2.  Edit values in `env.list`. See Configuration section below for what everything does.

## 2. Run docker

```sh
# Replace this with your own git wiki
git clone https://github.com/razorpay/gollum-setup.wiki.git
cd gollum-setup
docker pull razorpay/gollum:2.0.0
docker run -v /path/to/wiki:/wiki -v /path/to/id_rsa:/root/.ssh/id_rsa -p 8080:8080 --env-file env.list razorpay/gollum:2.0.0
```

If you'd like to setup a reverse proxy for TLS, you'll have to do that on your own for now. The container respects the `X-Forwarded-*` headers and will work behind a reverse-proxy correctly.

## Configuration

You can pass it the following environment variables:

```sh
OAUTH2_PROXY_CLIENT_ID=
OAUTH2_PROXY_CLIENT_SECRET=
OAUTH2_PROXY_PROVIDER=
OAUTH2_PROXY_EMAIL_DOMAIN=
OAUTH2_PROXY_REDIRECT_URL=
OAUTH2_PROXY_COOKIE_SECRET=
# Restrict logins to specific domains
OAUTH2_PROXY_EMAIL_DOMAINS=*
# Remove the opening provider button and automatically initiate login flow
OAUTH2_PROXY_SKIP_PROVIDER_BUTTON=true
# Change the banner on the provider page
OAUTH2_PROXY_BANNER=-
# Change footer at the bottom of the provider page
OAUTH2_PROXY_FOOTER=-
# Helpful for local testing
OAUTH2_PROXY_COOKIE_SECURE=
OAUTH2_PROXY_FORCE_HTTPS=
GIT_REMOTE_URL=
```

If you have a reverse proxy, use `OAUTH2_PROXY_REDIRECT_URL` to pass the complete HTTPS URL. If the `GIT_REMOTE_URL` is setup, and the `/wiki` directory is not a valid git repository, it automatically clones the given repo.

Any other environment variables that are supported by the [oAuth2 Proxy](https://pusher.github.io/oauth2_proxy/configuration#environment-variables) will also automatically work. Please note that some config options might have to be pluralized to work.

## GitHub

If you have `GIT_REMOTE_URL` setup, make sure that either the repo is read-world, or you mount the correct `id_rsa` file in the `/root/.ssh` directory.

## License

The very little code in this repository is licensed under MIT.

[docker]: https://github.com/gollum/gollum/wiki/Gollum-via-Docker
[blog]: https://razorpay.com/blog/TODO
