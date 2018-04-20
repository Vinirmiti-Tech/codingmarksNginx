FROM debian:7

RUN apt-get update && \
    apt-get -y install socat && \
    apt-get clean

USER nobody

CMD socat -dddd TCP-LISTEN:1000,reuseaddr,fork TCP:mongodb-primary:27017 & socat -dddd TCP-LISTEN:2000,reuseaddr,fork TCP:mongodb-secondary:27017 & socat -dddd TCP-LISTEN:3000,reuseaddr,fork TCP:mongodb-arbiter:27017
