#!/bin/bash

#update
dnf update

#hostname setup
hostnamectl set-hostname “Set-FI”

#activate RPMFusion repository
rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-24.noarch.rpm

#gnome tweak tool
dnf install gnome-tweak-tool-3.20.1-1.fc24.noarch 

# vlc player
dnf install vlc

#java web plugins
dnf install java-openjdk icedtea-web

# GIMP
dnf install gimp

# Unzip
dnf install unzip

# Spotify
dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
dnf install spotify-client

# Pidgin IRC
dnf install pidgin


# tools

# maven
dnf install maven

# git
dnf install git

# tmux
dnf install tmux-2.2-1.fc24.x86_64 

# terminator
dnf install terminator

