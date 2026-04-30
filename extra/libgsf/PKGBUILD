# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgbase=libgsf
pkgname=(
  libgsf
  libgsf-docs
)
pkgver=1.14.57
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
b2sums=('dbe6c71b48131aa59011887f62fc5e865c7f54e49cc13665351ddbb214109819a017b5e3ebb2c3cd89b7ab6d9f4707b8561a842b75ecce797acc57d34be0e09a')

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
