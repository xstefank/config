
# xbacklight not working with Fedora 26 i3wm
{no outputs have backlight property}

1. create /usr/share/X11/xorg.conf.d/20-intel.conf
2. paste
Section "Device"
        Identifier  "card0"
        Driver      "intel"
        Option      "Backlight"  "intel_backlight"
        BusID       "PCI:0:2:0"
EndSection
3. reboot

