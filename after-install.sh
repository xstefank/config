#!/bin/sh

sudo dnf install -y conky feh snap pip task dropbox gedit xclip oathtool scrot inkscape gimp podman xbanish 

sudo dnf config-manager setopt google-chrome.enabled=1
sudo dnf install google-chrome-stable

sudo dnf install dnf5-plugins
sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli

pip install spotify-cli-linux

