FROM rethinkdb

RUN apt-get update --fix-missing \
  && apt-get -y install python-pip cron \
  && rm -rf /var/lib/apt/lists/* \
  && pip install rethinkdb \
  && mkdir /backups \
  && mkdir /scripts

ENV CRON_TIME="0 0 * * *"

ADD run.sh /run.sh

VOLUME ["/backups"]

CMD ["/run.sh"]
