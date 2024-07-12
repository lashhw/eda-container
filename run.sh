#!/bin/bash
xhost +local:
podman start rhel8
podman exec -it -u ${USER} rhel8 zsh
