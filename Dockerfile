FROM ubuntu:16.04

# Install dependencies
RUN apt-get update --yes && apt-get upgrade --yes
RUN apt-get install git nodejs npm \
libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev libpng-dev build-essential g++ \
ffmpeg \
redis-server --yes

RUN ln -s `which nodejs` /usr/bin/node

# Non-privileged user
RUN useradd -m atv-converter
USER atv-converter
WORKDIR /home/atv-converter

# Clone repo
RUN git clone https://github.com/ft-interactive/atv-converter.git
WORKDIR /home/atv-converter/atv-converter

# Install dependencies
RUN npm install
