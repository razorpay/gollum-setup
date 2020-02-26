FROM ruby:alpine

WORKDIR /app

RUN apk --no-cache add \
    icu-dev alpine-sdk dumb-init openssh-client

RUN wget -O /tmp/oauth2_proxy.tar.gz https://github.com/pusher/oauth2_proxy/releases/download/v5.0.0/oauth2_proxy-v5.0.0.linux-amd64.go1.13.6.tar.gz && \
    cd /tmp/ && \
    tar -xzf /tmp/oauth2_proxy.tar.gz oauth2_proxy-v5.0.0.linux-amd64.go1.13.6/oauth2_proxy --strip-components=1 && \
    mv /tmp/oauth2_proxy /usr/local/bin/oauth2_proxy && \
    chmod +x /usr/local/bin/oauth2_proxy && \
    rm /tmp/oauth2_proxy.tar.gz

COPY ["Gemfile.lock", "Gemfile", "config.ru", "/app/"]

WORKDIR /app
RUN gem install bundler && bundle install

COPY gollum.sh /

# Disable host key verification and create .ssh directory
RUN echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
    mkdir /root/.ssh

ENTRYPOINT ["/gollum.sh"]

COPY ["cron", "/app/"]
EXPOSE 8080