#!/bin/bash

sed -i "s/^kairosdb.datastore.cassandra.host_list.*$/kairosdb.datastore.cassandra.host_list=$CASSANDRA_HOST_LIST/" /opt/kairosdb/conf/kairosdb.properties

/opt/kairosdb/bin/kairosdb.sh run