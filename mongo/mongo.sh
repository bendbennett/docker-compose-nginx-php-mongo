#!/bin/bash

AVAILABILITY_ZONE=$(curl --connect-timeout 5 http://169.254.169.254/latest/meta-data/placement/availability-zone)

if [[ $AVAILABILITY_ZONE == *"eu-west"* ]]; then
    # Start mongo daemon as we're overriding CMD ["mongod"] in the base docker image - https://github.com/docker-library/mongo/blob/812b8fb401a929c312c7222a26b707a6415450c6/3.4/Dockerfile
    /entrpoint.sh mongod --bind_ip_all --replSet "rs0" &
else
    /entrypoint.sh mongod --bind_ip_all &
fi

if [[ $AVAILABILITY_ZONE = "eu-west-1a" ]]; then
    sleep 120
    mongo --eval "rs.initiate({_id:\"rs0\",members:[{_id: 0,host: 'mongo-rs1.internal.synaptology.net:27017'}]})"
    mongo --eval "rs.add('mongo-rs2.internal.synaptology.net')"
    mongo --eval "rs.add('mongo-rs3.internal.synaptology.net')"
fi

# Restore demo.users from dump file to "seed" the database
# Adapted from http://stackoverflow.com/questions/39282957/mongorestore-in-a-dockerfile
mongorestore /tmp/dump

# Prevent container from exiting
tail -f /dev/null
