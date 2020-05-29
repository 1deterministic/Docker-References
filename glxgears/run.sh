#!/bin/bash

xhost +
sudo docker run -it --rm --shm-size 1G --device=/dev/dri --group-add video -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --privileged 1d/glxgears:latest
