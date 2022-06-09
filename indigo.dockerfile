FROM docker.io/balenalib/rpi-raspbian:bullseye

RUN echo 'deb [trusted=yes] https://indigo-astronomy.github.io/indigo_ppa/ppa indigo main' > /etc/apt/sources.list.d/indigo.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	indigo \
	lsb-release \
	systemd \
	&& apt-get autoremove -y \
	&&  rm -rf /var/lib/apt/lists/*

# Indigo server
EXPOSE 7624/tcp
ENTRYPOINT ["/usr/bin/indigo_server"]
CMD ["indigo_ccd_asi","indigo_agent_scripting"]
