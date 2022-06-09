#!/bin/bash

podman pod create --name azotea -p 8624:8624 -p 7624:7624
podman run -d --name indiserver --pod azotea \
 --restart on-failure \
 -v /dev/bus/usb:/dev/bus/usb \
 --mount type=tmpfs,destination=/tmp \
 --health-interval 1m --health-timeout 5s --health-start-period 2m \
 --health-cmd 'curl -I --fail http://localhost:8624 || exit 1'  \
localhost/indi:0.1.0

