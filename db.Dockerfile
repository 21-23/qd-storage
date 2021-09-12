FROM postgres:13

RUN apt-get update \
    && apt-get -qq install \
    # sqitch dependencies
    perl-doc \
    sqitch

COPY ./db.init.sql /docker-entrypoint-initdb.d/
