FROM ubuntu:latest

MAINTAINER Gianpaul Custodio "hackemate@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y net-tools \
	curl \
	git \
	nano \
	apache2 \
	php

EXPOSE 80

ENTRYPOINT service apache2 start && /bin/bash
