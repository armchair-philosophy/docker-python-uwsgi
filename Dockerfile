FROM alpine:3.6

RUN apk update

RUN apk add \
    python2 \
    py2-pip \
    sqlite \
    curl \
    python2-pip
RUN pip install --upgrade pip

RUN curl https://github.com/progrium/entrykit/releases/download/v0.4.0/entrykit_0.4.0_Linux_x86_64.tgz | \
    tar -x && \
    mv ./entrykit /usr/local/bin/. && \
    chmod +x /usr/local/bin/entrykit && \
    entrykit --symlink

RUN apk cache clean
