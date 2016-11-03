#!/bin/bash

#update
dnf update

#activate RPMFusion repository
rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-24.noarch.rpm

#gnome tweak tool
dnf install gnome-tweak-tool-3.20.1-1.fc24.noarch 

# vlc player
dnf install vlc

#java web plugins
dnf install java-openjdk icedtea-web


