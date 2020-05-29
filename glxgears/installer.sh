#!/bin/bash

# create an unprivileged user
useradd --create-home user

# update repos before downloading software
dnf update -y

# install and configure sudo
dnf install sudo -y
groupadd sudo
usermod -aG sudo user
mkdir -p /etc/sudoers.d
echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user
chmod 0440 /etc/sudoers.d/user

# install mesa open source drivers and add user to the video group
dnf install mesa-dri-drivers mesa-vulkan-drivers mesa-libGL -y
groupadd video
usermod -aG video user

# install glxgears
dnf install glx-utils -y

echo "Done!"
