#!/bin/bash

# if using docker
sudo docker run -it --rm -v /run/user/1000/pulse:/run/user/1000/pulse --privileged 1d/noise:latest

# if using podman (https://github.com/containers/libpod/issues/3683)
# sudo podman run -it --rm -v /run/user/1000/pulse:/run/user/1000/pulse --privileged --security-opt label=disable 1d/noise:latest
