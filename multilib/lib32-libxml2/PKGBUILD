# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=lib32-libxml2
pkgname=(
  lib32-libxml2
)
pkgver=2.11.5
pkgrel=1
pkgdesc="XML C parser and toolkit (32-bit)"
url="https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home"
arch=(x86_64)
license=(custom:MIT)
depends=(
  lib32-icu
  lib32-xz
  lib32-zlib
  libxml2
)
makedepends=(
  git
  python
)
_commit=2b998a4ffbdfea04fc6a620721abc690a15743af  # tags/v2.11.5^0
source=(
  "git+https://gitlab.gnome.org/GNOME/libxml2.git#commit=$_commit"
  0001-HACK-Don-t-run-fuzzing-tests.patch
  https://www.w3.org/XML/Test/xmlts20130923.tar.gz
)
b2sums=('SKIP'
        '5f47a4949e9485c40b5685840d48aef87aa7919eb7e0afd679b598ee054392f18a657947c10c627d3239937e53611f8263c47312d26b093aa5973854307f53aa'
        '63a47bc69278ef510cd0b3779aed729e1b309e30efa0015d28ed051cc03f9dfddb447ab57b07b3393e8f47393d15473b0e199c34cb1f5f746b15ddfaa55670be')

pkgver() {
  cd libxml2
  git describe --tags | sed 's/-rc/rc/;s/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

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
    --prefix=/usr
    --libdir=/usr/lib32
    --sysconfdir=/etc
    --localstatedir=/var
    --without-history
    --with-icu
    --without-python
    --with-threads
    --disable-static
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
