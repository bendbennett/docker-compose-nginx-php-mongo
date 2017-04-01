#!/bin/bash
# Adapted from http://stackoverflow.com/questions/39282957/mongorestore-in-a-dockerfile

# Start mongo daemon as we're overriding CMD ["mongod"] in the base docker image - https://github.com/docker-library/mongo/blob/812b8fb401a929c312c7222a26b707a6415450c6/3.4/Dockerfile
/entrypoint.sh mongod &

# Restore demo.users from dump file to "seed" the database
mongorestore /tmp/dump

# Prevent container from exiting
tail -f /dev/null
