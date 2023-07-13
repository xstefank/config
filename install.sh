#/bin/sh

echo "Installing rpms..."
sudo dnf install -y nautilus scrot httpie podman podman-compose gimp libreoffice task xbanish conky gnome-control-center gnome-tweaks vlc pip bat blueman cargo lxappearance unar thunderbird snapd hub dropbox linuxbrew

echo "Linux Brew..."
brew install jenv

echo "SdkMan..."
curl -s "https://get.sdkman.io" | bash

echo "Configuration..."
jenv enable-plugin export

echo "Done"
