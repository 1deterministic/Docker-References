#!/bin/bash

xhost +
sudo docker run -it --rm --shm-size 1G --device=/dev/dri --group-add video -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /run/user/1000/pulse:/run/user/1000/pulse --privileged 1d/firefox:latest
