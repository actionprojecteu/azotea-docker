#!/bin/bash

podman pod create --name azotea -p 8624:8624
podman run -d --name indiserver --pod azotea ---restart=on-failure \
--health-interval 1m --health-timeout 5s --health-start-period 2m \
--health-cmd 'curl -I --fail http://localhost:8624 || exit 1'  \
localhost/acquisition:0.1.0

