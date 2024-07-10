#!/bin/bash
xhost +local:
podman start rhel8
podman exec -it -u lashhw rhel8 zsh
podman stop rhel8
