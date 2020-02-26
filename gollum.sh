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
    rm -rf /wiki/{*,.*}
    git clone $GIT_REMOTE_URL /wiki
  fi
fi

# If we have a private SSH key
# fix the perms and generate the public key
if [ -f /root/.ssh/id_rsa ]; then
  chmod 600 /root/.ssh/id_rsa

  if [ ! -d /root/.ssh/id_rsa.pub ]; then
    ssh-keygen -y -f /root/.ssh/id_rsa > /root/.ssh/id_rsa.pub
  fi
  
  echo "[+] Using SSH key for git pushes"
  echo "*/5 * * * * /app/cron" > /tmp/crontab.tmp
  crontab /tmp/crontab.tmp
  rm /tmp/crontab.tmp
  echo "[+] Crontab setup for every 5 minutes"
fi

oauth2_proxy -http-address "0.0.0.0:8080" \
             -upstream "http://localhost:4000" &

rackup --port 4000 --host 0.0.0.0 &
# -f  Foreground
crond -f