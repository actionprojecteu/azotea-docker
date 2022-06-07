#!/bin/bash

podman pod create --name azotea -p 7624:7624
podman run -ti --name indigo --pod azotea --restart=on-failure \
--privileged -v /dev/bus/usb:/dev/bus/usb \
--mount type=tmpfs,destination=/tmp \
localhost/indigo:0.1.0

