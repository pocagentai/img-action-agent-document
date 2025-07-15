FROM alpine:3.16

RUN apk update && apk add curl py-pip python3
RUN pip install --quiet pyfiglet
COPY bin/aagent /usr/bin
 