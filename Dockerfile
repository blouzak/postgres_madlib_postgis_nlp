FROM postgres:11.8
RUN apt-get update && \
    apt-get install -y \
    cmake \
    pgxnclient \
    postgresql-server-dev-11 \
    postgresql-plpython3-11 \
    postgresql-plpython-11 \
    g++ \
    m4 \
    patch \
    vim \
    postgresql-11-postgis-2.5 \
    python3-nltk \
    python3-pip
RUN pip3 install textblob vaderSentiment
RUN python3 -m nltk.downloader -d /usr/local/share/nltk_data all
RUN MAKEFLAGS='-j1' pgxn install madlib 

ENV PGUSER=postgres
