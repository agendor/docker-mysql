FROM mysql:5.5

MAINTAINER Agendor

RUN apt-get update \
  && apt-get install -y curl \
  && apt-get autoremove --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./agendor.cnf /etc/mysql/conf.d/
ADD ./entrypoint.sh /dump-cp-entrypoint.sh

ENTRYPOINT ["/dump-cp-entrypoint.sh"]
CMD ["mysqld"]
