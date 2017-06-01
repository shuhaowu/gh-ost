#!/bin/bash

NAME=ghostci

set -x

if lxc-ls | grep -q $NAME ; then
  lxc-stop -n $NAME
fi

lxc-start -n $NAME
sleep 5
lxc-attach --clear-env -n $NAME -- sudo -H -u travis /gh-ost/lxc/start-mysql.sh
lxc-attach --clear-env -n $NAME -- ps aux