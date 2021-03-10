FROM ubuntu:latest

ENV WATCHED_FOLDER=/watched-folder
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    cups cups-bsd ghostscript bash cups-filters cups-ipp-utils a2ps inoticoming trash-cli\
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p ${WATCHED_FOLDER}

COPY entrypoint.sh /
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
