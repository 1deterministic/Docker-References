#!/bin/bash

sudo docker run -it --rm -v /run/user/1000/pulse:/run/user/1000/pulse --privileged 1d/noise:latest
