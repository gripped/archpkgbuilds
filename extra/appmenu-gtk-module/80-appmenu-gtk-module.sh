#!/bin/sh

case ":$GTK_MODULES:" in
    *:appmenu-gtk-module:*) echo "GTK_MODULES=$GTK_MODULES" ;;
    *) echo "GTK_MODULES=${GTK_MODULES:+$GTK_MODULES:}appmenu-gtk-module" ;;
esac

[ -z "$UBUNTU_MENUPROXY" ] && echo "UBUNTU_MENUPROXY=1"
exit 0
