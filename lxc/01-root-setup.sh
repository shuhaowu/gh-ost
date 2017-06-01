#!/bin/bash

echo "deb http://repo.percona.com/apt precise main" >> /etc/apt/sources.list
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -yq --no-install-suggests --no-install-recommends --force-yes install \
  percona-server-client-5.7 percona-server-server-5.7 curl git

adduser --gecos "" --disabled-password travis

curl -sL -o /usr/local/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme
chmod +x /usr/local/bin/gimme

cp -ar /gh-ost /home/travis/gh-ost
chown -R travis:travis /home/travis/gh-ost