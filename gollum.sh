#!/usr/bin/dumb-init /bin/sh
cd /app

if [ ! -d /wiki/.git ]; then
  # Create a new git repo if we don't have a URL
  if [[ -z "${GIT_REMOTE_URL}" ]]; then
    git init /wiki
  # Clone if we have a URL
  else
    git clone $GIT_REMOTE_URL /wiki
  fi
fi

oauth2_proxy -client-id "$CLIENT_ID" -client-secret "$CLIENT_SECRET" \
  -email-domain "$EMAIL_DOMAIN" -http-address "0.0.0.0:80" \
  -cookie-secret "$COOKIE_SECRET" -redirect-url "$REDIRECT_URL" \
  -provider "$PROVIDER" -upstream "http://localhost:4000" &
rackup --port 4000 --host 0.0.0.0