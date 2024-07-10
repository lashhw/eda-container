#!/bin/bash
mkdir -p d
mkdir -p cad
mkdir -p home
podman create \
    --name=rhel8 \
    --publish=22222:22 \
    --add-host=lshc:140.126.24.16 \
    --volume ./d:/mnt/d \
    --volume ./cad:/cad \
    --volume ./home:/home \
    --env "DISPLAY=${DISPLAY}" \
    --mount type=bind,src=/tmp/.X11-unix,dst=/tmp/.X11-unix \
    --userns=keep-id \
    --user=0:0 \
    registry.access.redhat.com/ubi8-init:8.9
