FROM alpine:3.16

RUN apk update && apk add curl py-pip python3 make

RUN mkdir /workspace /workspace/bin
COPY bin/aagent /workspace/bin
COPY entrypoint.sh Makefile requirements.txt /workspace

WORKDIR /workspace
RUN make venv install
RUN chmod a+x entrypoint.sh bin/aagent
ENTRYPOINT ["sh", "/workspace/entrypoint.sh"]


 