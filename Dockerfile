FROM debian:trixie-slim

# set work directory
WORKDIR /app

# set time
RUN ln -fs /usr/share/zoneinfo/America/Santiago /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

# install software
RUN apt update && apt install -y \
  build-essential \
  ca-certificates \
  sqlite3 \
  soju \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/soju

ENTRYPOINT ["soju"]
