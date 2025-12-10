# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgbase=libgsf
pkgname=(
  libgsf
  libgsf-docs
)
pkgver=1.14.54
pkgrel=1
pkgdesc="Extensible I/O abstraction library for dealing with structured file formats"
url="https://gitlab.gnome.org/GNOME/libgsf"
arch=(x86_64)
license=(LGPL-2.1-only)
depends=(
  bzip2
  gdk-pixbuf2
  glib2
  glibc
  libxml2
  zlib
)
makedepends=(
  autoconf-archive
  git
  gobject-introspection
  gtk-doc
)
checkdepends=(
  perl-xml-parser
  unzip
)
source=("git+$url.git#tag=LIBGSF_${pkgver//./_}")
b2sums=('6e7f4d21e43b2d49cccecc8fac8f978c5a641b46daf1bd8d2c2049d52b8e004021ae49ac3124fec0b4a86a73e4501fb6b5ed0911773d3e88c1731035572ef0cc')

prepare() {
  cd libgsf
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --disable-static
    --enable-introspection
    --enable-gtk-doc
  )

  cd libgsf
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  make -C libgsf check
}

package_libgsf() {
  provides=(libgsf-1.so)

  make -C libgsf DESTDIR="$pkgdir" install

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/gtk-doc
}

package_libgsf-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
