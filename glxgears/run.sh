#!/bin/bash

xhost +

# if using docker
sudo docker run -it --rm --device=/dev/dri --group-add video -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --privileged 1d/glxgears:latest

# if using podman (https://github.com/containers/libpod/issues/3683)
# sudo podman run -it --rm --device=/dev/dri --group-add video -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --privileged --security-opt label=disable 1d/glxgears:latest
