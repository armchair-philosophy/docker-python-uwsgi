FROM ubuntu:16.04

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y python python-pip sqlite3 python-dev curl git libmysqlclient-dev wget
RUN pip install --upgrade pip

RUN curl https://github.com/progrium/entrykit/releases/download/v0.4.0/entrykit_0.4.0_Linux_x86_64.tgz | \
    tar -x && \
    mv ./entrykit /usr/local/bin/. && \
    chmod +x /usr/local/bin/entrykit && \
    entrykit --symlink

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install uwsgi flask flask-script flask-cors flask-redis flask-sqlalchemy requests requests_mock simplejson validators raven blinker mockredispy mysql-python python-dateutil six google-cloud-pubsub more_itertools


