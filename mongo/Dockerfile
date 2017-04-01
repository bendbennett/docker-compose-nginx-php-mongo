FROM mongo:3.4

COPY dump /tmp/dump

COPY mongo.sh /tmp/mongo.sh

RUN chmod 777 /tmp/mongo.sh

CMD /tmp/mongo.sh
