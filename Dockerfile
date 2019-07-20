FROM openjdk:12-alpine

ARG cachePath=/tmp/npmcache

RUN apk add --no-cache \
            --update \
            mvn \
            nodejs \
            npm \
            openssh-client \
            zip

RUN mkdir ~/.ssh/
RUN echo 'StrictHostKeyChecking no' > ~/.ssh/config

RUN npm install --global \
                --cache ${cachePath} \
                @angular/cli
RUN rm -rf ${cachePath} /tmp/npm* /root/.config
