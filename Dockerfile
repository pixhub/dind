FROM ubuntu:18.04

ENV DOCKER_VERSION=20.10.6

RUN apt-get update \
    && apt-get install -y wget zip \
    && wget https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
    && wget https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip \
    && tar xzvf docker-${DOCKER_VERSION}.tgz \
    && unzip awscli-exe-linux-x86_64.zip \
    && /aws/install \
    && cp /docker/docker /usr/local/bin/ \
    && rm -rf /awscli-exe-linux-x86_64.zip /docker-${DOCKER_VERSION}.tgz /docker

CMD ["docker", "version"]
