#!/bin/bash

podman pod create --name azotea -p 8624:8624
podman run --pod azotea -d --name azotake --restart=always localhost/acquisition:0.1.0
