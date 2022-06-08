FROM docker.io/balenalib/rpi-raspbian:buster

RUN echo 'deb [trusted=yes] https://indigo-astronomy.github.io/indigo_ppa/ppa indigo main' > /etc/apt/sources.list.d/indigo.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	ain-imager \
	indigo \
	indigo-control-panel \
	lsb-release \
	systemd \
	&& apt-get autoremove -y 
	&&  rm -rf /var/lib/apt/lists/*

# Indigo server
EXPOSE 7624/tcp
ENTRYPOINT ["/usr/bin/indigo_server", "-v"]
CMD ["indigo_ccd_asi"]
