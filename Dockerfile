FROM node:alpine
MAINTAINER  fengcl <finghine.feng@gmail.com>
RUN apk update && apk upgrade && \
    apk add --no-cache git
WORKDIR /workdir
VOLUME ["/workdir"]
RUN npm install hexo-cli -g
EXPOSE 4000
CMD []

