# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=lib32-libxml2
pkgname=(
  lib32-libxml2
)
pkgver=2.12.7
pkgrel=1
pkgdesc="XML C parser and toolkit (32-bit)"
url="https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home"
arch=(x86_64)
license=(MIT)
depends=(
  lib32-glibc
  lib32-icu
  lib32-xz
  lib32-zlib
  libxml2
)
makedepends=(
  git
  python
)
source=(
  "git+https://gitlab.gnome.org/GNOME/libxml2.git#tag=v$pkgver"
  0001-HACK-Don-t-run-fuzzing-tests.patch
  https://www.w3.org/XML/Test/xmlts20130923.tar.gz
)
b2sums=('2b851cd42f2c283ef0eb9880ab0e4fe6719b657c40eaced14b3d378b1e4872b94f1e3c00d2b1b312cd81dec3c96c9f8f00745dd312a1e145cca0de625bc6c103'
        '6931b07a467874c3016deb7a68bab1e9cfaabc88fdeaf0ccf6c9cca02bbce9618b18f8c285f5748089138489d04d7c72a659b2bfd4ea5fe24ad273daacbd6d50'
        '63a47bc69278ef510cd0b3779aed729e1b309e30efa0015d28ed051cc03f9dfddb447ab57b07b3393e8f47393d15473b0e199c34cb1f5f746b15ddfaa55670be')

prepare() {
  cd libxml2

  # Use xmlconf from conformance test suite
  ln -s ../xmlconf

  # Do not run fuzzing tests
  git apply -3 ../0001-HACK-Don-t-run-fuzzing-tests.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --build="$CHOST"
    --host=i686-pc-linux-gnu
    --prefix=/usr
    --libdir=/usr/lib32
    --sysconfdir=/etc
    --localstatedir=/var
    --disable-static
    --without-history
    --with-icu
    --with-legacy
    --without-python
    --with-threads
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd libxml2
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libxml2
  make check
}

package_lib32-libxml2() {
  provides=(libxml2.so)

  cd libxml2
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/{include,share,bin}

  install -Dm644 Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
