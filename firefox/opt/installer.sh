#!/bin/bash

# create an unprivileged user
useradd --create-home user

# install rpmfusion repos
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

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
mkdir -p /etc/pulse
cp /opt/pulseaudio/client.conf /etc/pulse/client.conf

# install mesa open source drivers and add user to the video group
dnf install mesa-dri-drivers mesa-vulkan-drivers mesa-libGL -y
groupadd video
usermod -aG video user

# install firefox (fonts and font configuration missing, also no codecs installed at the time)
dnf install firefox -y
mkdir -p /home/user/.mozilla
cp -r /opt/mozilla/* /home/user/.mozilla
chown user:user -R /home/user/.mozilla

# install fonts
dnf install wget tar -y
wget https://github.com/1deterministic/Scripts/raw/master/assets/fonts.tar.gz -O /opt/fonts.tar.gz
tar xf /opt/fonts.tar.gz --directory /usr/share/fonts

# install codecs
dnf install ffmpeg -y

# you can also install the same themes you use on the host for consistency, default is adwaita
# dnf install arc-theme papirus-icon-theme -y

# remove everything from /opt
rm -r /opt/*

echo "Done!"
