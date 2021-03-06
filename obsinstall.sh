#!/bin/bash
#File: installobs.sh (sudo chmod +x installobs.sh)
#!!! Please run from /home/pi/Downloads (cd /home/pi/Downloads)

sudo apt-get install libwayland-dev
sudo apt-get install pipewire
sudo apt-get install qtbase5-private-dev
sudo apt-get --allow-releaseinfo-change update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
sudo apt-get -y install build-essential checkinstall cmake git libmbedtls-dev libasound2-dev libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libavutil-dev libcurl4-openssl-dev libfontconfig1-dev libfreetype6-dev libgl1-mesa-dev libjack-jackd2-dev libjansson-dev libluajit-5.1-dev libpulse-dev libqt5x11extras5-dev libspeexdsp-dev libswresample-dev libswscale-dev libudev-dev libv4l-dev libvlc-dev libx11-dev libx11-xcb1 libx11-xcb-dev libxcb-xinput0 libxcb-xinput-dev libxcb-randr0 libxcb-randr0-dev libxcb-xfixes0 libxcb-xfixes0-dev libx264-dev libxcb-shm0-dev libxcb-xinerama0-dev libxcomposite-dev libxinerama-dev pkg-config python3-dev qtbase5-dev libqt5svg5-dev swig
sudo wget http://ftp.uk.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac1_0.1.4-2+b1_armhf.deb
sudo wget http://ftp.uk.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_0.1.4-2+b1_armhf.deb
sudo dpkg -i libfdk-aac1_0.1.4-2+b1_armhf.deb
sudo dpkg -i libfdk-aac-dev_0.1.4-2+b1_armhf.deb
sudo git clone --recursive https://github.com/obsproject/obs-studio.git
cd obs-studio
sudo mkdir build && cd build
sudo cmake -DENABLE_PIPEWIRE=OFF -DBUILD_BROWSER=OFF -DUNIX_STRUCTURE=1 -DCMAKE_INSTALL_PREFIX=/usr .
sudo make -j4
sudo make install

exit 0
