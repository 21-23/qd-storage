FROM postgres:13

RUN apt-get update \
    && apt-get -qq install \
    # pgjwt dependencies
    build-essential \
    git \
    postgresql-server-dev-13 \
    # sqitch dependencies
    perl-doc \
    sqitch

COPY ./db.init.sql /docker-entrypoint-initdb.d/

RUN apt-get install

RUN git clone https://github.com/michelp/pgjwt.git
RUN cd pgjwt && make install
