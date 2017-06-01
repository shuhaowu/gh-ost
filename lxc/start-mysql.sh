#!/bin/bash


cd /gh-ost
source travis/00-_common.sh

set -xe

trap "" ERR

rm $MASTER_MYSQL_DIR/data/mysql.err
rm $SLAVE_MYSQL_DIR/data/mysql.err

(setsid $MASTER_MYSQLD &)
(setsid $SLAVE_MYSQLD &)

sleep 1
