#!/bin/bash

NAME=ghostci

set -x

if lxc-ls | grep -q $NAME ; then
  lxc-stop -n $NAME
  lxc-destroy -n $NAME
fi

lxc-create -n $NAME -t download -- --dist ubuntu --arch amd64 --release precise
echo "lxc.mount.entry = $PWD gh-ost none bind,create=dir" >> /var/lib/lxc/$NAME/config

lxc-start -n $NAME
lxc-wait -n $NAME -s RUNNING
sleep 4
lxc-attach --clear-env -n $NAME /gh-ost/lxc/01-root-setup.sh
lxc-attach --clear-env -n $NAME -- sudo -H -u travis /gh-ost/lxc/02-user-setup.sh

