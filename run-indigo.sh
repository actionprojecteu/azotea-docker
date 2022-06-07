#!/bin/bash

podman pod create --name azotea -p 7624:7624
podman run -ti --name indigo --pod azotea --restart=on-failure \
localhost/indigo:0.1.0

