FROM alpine:3.16

RUN apk update && apk add curl py-pip python3
RUN pip install --quiet pyfiglet
COPY bin/aagent /usr/bin
RUN chmod a+x /usr/bin/aagent

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod a+x /usr/bin/entrypoint.sh

ENTRYPOINT ["sh", "/usr/bin/entrypoint.sh"]
 