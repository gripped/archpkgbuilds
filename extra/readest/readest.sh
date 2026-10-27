#!/bin/sh
# appmenu-gtk-module (loaded via GTK_MODULES or KDE's gtk-3.0/settings.ini)
# leaves a D-Bus name watch behind whose callback segfaults the CEF runtime.
export UBUNTU_MENUPROXY=0
exec /usr/share/Readest/readest "$@"
