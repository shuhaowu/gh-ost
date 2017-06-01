#!/bin/bash

set -xe

eval "$(gimme 1.7)"

cd /home/travis/gh-ost

travis/01-install-mysql.sh
travis/02-install-ghost.sh
travis/03-run-unittests.sh
travis/04-run-localtests.sh
travis/05-shutdown-mysql.sh
