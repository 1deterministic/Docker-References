#!/bin/bash

xhost +

# if using docker
sudo docker run -it --rm --shm-size 1G --device=/dev/dri --group-add video -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /run/user/1000/pulse:/run/user/1000/pulse --privileged 1d/firefox:latest

# if using podman (https://github.com/containers/libpod/issues/3683)
# sudo podman run -it --rm --shm-size 1G --device=/dev/dri --group-add video -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /run/user/1000/pulse:/run/user/1000/pulse --privileged --security-opt label=disable 1d/firefox:latest
