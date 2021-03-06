#!/bin/bash

podman pod create --name azotea -p 7624:7624
podman run -d --name indigo --pod azotea \
 --restart on-failure \
 --systemd always \
 -v /dev/bus/usb:/dev/bus/usb  \
 --mount type=tmpfs,destination=/tmp \
--health-interval 1m --health-timeout 5s --health-start-period 2m \
--health-cmd 'curl -I --fail http://localhost:7624 || exit 1'  \
localhost/indigo:0.1.0

