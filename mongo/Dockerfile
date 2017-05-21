FROM mongo:3.4

RUN apt-get update && apt-get install -y curl

COPY dump /tmp/dump

COPY mongo.sh /tmp/mongo.sh

RUN chmod +x /tmp/mongo.sh

CMD /tmp/mongo.sh
