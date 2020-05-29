# Docker-References
Anything interesting I eventually create using Docker

## How to use this repo
In short, `./build.sh` to build the docker image and `./run.sh` to run it with the correct arguments (will be auto removed when closed `--rm`)

**Do not run the `installer.sh`**, it is intended to execute from the container, and as such you can customize it the way you want. I'm using installer files instead of appending scripts to the `RUN` section of `Dockerfile` just because I find it easier to deal with.