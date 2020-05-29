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

# install pulseaudio and add user to the audio group
dnf install pulseaudio pulseaudio-utils -y
groupadd audio
usermod -aG audio user

echo "Done!"