#!/usr/bin/dumb-init /bin/sh
cd /app

if [ ! -d /wiki/.git ]; then
  # Create a new git repo if we don't have a URL
  if [[ -z "${GIT_REMOTE_URL}" ]]; then
    echo "[+] Initializing new git repo"
    git init /wiki
  # Clone if we have a URL
  else
    echo "[+] Cloning git repo from $GIT_REMOTE_URL"
    git clone $GIT_REMOTE_URL /wiki
  fi
fi

# If we have a private SSH key
# fix the perms and generate the public key
if [ -f /root/.ssh/id_rsa ]; then
  chmod 600 /root/.ssh/id_rsa
  ssh-keygen -y -f /root/.ssh/id_rsa > /root/.ssh/id_rsa.pub
  echo "[+] Using SSH key for git pushes"
fi

oauth2_proxy -client-id "$CLIENT_ID" -client-secret "$CLIENT_SECRET" \
  -email-domain "$EMAIL_DOMAIN" -http-address "0.0.0.0:80" \
  -cookie-secret "$COOKIE_SECRET" -redirect-url "$REDIRECT_URL" \
  -provider "$PROVIDER" -upstream "http://localhost:4000" &

rackup --port 4000 --host 0.0.0.0