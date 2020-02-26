# Migration Guide

If you are migrating from v1.0 to v2.0 of the proxy, the following environment variables must be renamed:

|Old Name|New Name|
|--------|--------|
|`CLIENT_ID`|`OAUTH2_PROXY_CLIENT_ID`|
|`CLIENT_SECRET`| `OAUTH2_PROXY_CLIENT_SECRET` |
|`PROVIDER`| `OAUTH2_PROXY_PROVIDER` |
|`REDIRECT_URL`| `OAUTH2_PROXY_REDIRECT_URL` |
|`COOKIE_SECRET`| `OAUTH2_PROXY_COOKIE_SECRET` |
|`EMAIL_DOMAIN`| `OAUTH2_PROXY_EMAIL_DOMAINS` |
|`SKIP_PROVIDER_BUTTON`| `OAUTH2_PROXY_SKIP_PROVIDER_BUTTON` |
|`BANNER`| `OAUTH2_PROXY_BANNER` |
|`FOOTER`| `OAUTH2_PROXY_FOOTER` |
|`COOKIE_SECURE`| `OAUTH2_PROXY_COOKIE_SECURE` |
|`FORCE_HTTPS`| `OAUTH2_PROXY_FORCE_HTTPS` |

v2 also supports many new environment variables, you can read about them in the README. A few important ones are:

```sh
# Remove the opening provider button and automatically initiate login flow
OAUTH2_PROXY_SKIP_PROVIDER_BUTTON=true
# Change the banner on the provider page
OAUTH2_PROXY_BANNER=-
# Change footer at the bottom of the provider page
OAUTH2_PROXY_FOOTER=-
# If you are running behind a reverse proxy
OAUTH2_REVERSE_PROXY=true
```