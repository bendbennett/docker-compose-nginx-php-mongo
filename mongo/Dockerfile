FROM mongo:4.0

RUN apt-get update && apt-get install -y curl

COPY dump /tmp/dump

COPY mongo.sh /tmp/mongo.sh

RUN chmod +x /tmp/mongo.sh

RUN ln -s /usr/local/bin/docker-entrypoint.sh entrypoint.sh

CMD /tmp/mongo.sh
