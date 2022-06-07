ROM docker.io/balenalib/rpi-raspbian:buster

RUN apt-get update && apt-get install -y apt-utils lsb-release systemd && rm -rf /var/lib/apt/lists/*
RUN echo 'deb [trusted=yes] https://indigo-astronomy.github.io/indigo_ppa/ppa indigo main' > /etc/apt/sources.list.d/indigo.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	ain-imager \
	indigo \
	indigo-control-panel \
	&&  rm -rf /var/lib/apt/lists/*

# Indigo server
EXPOSE 7624/tcp
#ENTRYPOINT ["/usr/bin/indigo_server"]
#CMD ["indigo_ccd_asi"]
