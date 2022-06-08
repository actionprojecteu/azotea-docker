FROM docker.io/balenalib/rpi-raspbian:buster

RUN apt-get update && apt-get install -y apt-utils lsb-release wget
RUN wget -O - https://www.astroberry.io/repo/key | sudo apt-key add - \
    && echo 'deb https://www.astroberry.io/repo/ buster main' > /etc/apt/sources.list.d/astroberry.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	indi-full \
	python3 \
	python3-pip \ 
	&&  rm -rf /var/lib/apt/lists/* \
    && pip3 install indiweb

# Indiserver and webserver ports respectively
EXPOSE 7624/tcp 8624/tcp

HEALTHCHECK --start-period=2m --interval=1m --timeout=5s --retries=3 \
  CMD curl -I --fail http://localhost:8624 || exit 1

ENTRYPOINT ["/usr/local/bin/indi-web"]
