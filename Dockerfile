FROM node:9-alpine

# curl and python for aws
RUN apk --no-cache add curl python

# aws sdk
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"\
  && unzip awscli-bundle.zip\
  && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# tools for publishing
RUN apk --no-cache add bash make git

# g++ for ursa build
RUN apk --no-cache add g++

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "node" ]
