# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=libdmapsharing
pkgver=3.9.13
pkgrel=2
pkgdesc="A library that implements the DMAP family of protocols"
url="https://www.flyn.org/projects/libdmapsharing/index.html"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  avahi
  gdk-pixbuf2
  glib2
  glibc
  gst-plugins-base-libs
  gstreamer
  libsoup3
  zlib
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  vala
)
provides=(libdmapsharing-4.0.so)
source=("git+https://gitlab.gnome.org/GNOME/libdmapsharing.git#tag=LIBDMAPSHARING_${pkgver//./_}")
b2sums=('4df17a6e8b7b74ad527e4e7447414a34f021e647b1d7afabf21ec062deb8dd8083039639f5c488209442cbd19e0b318a0e0499a68e442ab326ad3d6d91e8f08d')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_args=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --with-mdns=avahi

    # Disable tests; get built into the library, adding a dep on libcheck
    --disable-tests

    # GTK-docs are broken when tests are disabled
    --disable-gtk-doc
  )


  cd $pkgname
  ./configure "${configure_args[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
