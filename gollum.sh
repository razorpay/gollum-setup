#!/usr/local/bin/dumb-init /bin/sh
cd /app
oauth2_proxy -config /app/oauth2_proxy.cfg &
rackup --port 4000 --host 0.0.0.0