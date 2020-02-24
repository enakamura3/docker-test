FROM ubuntu
MAINTAINER naka
RUN apt update
RUN apt install -y sl
ENV name Mate
ENTRYPOINT echo Hi $name!
