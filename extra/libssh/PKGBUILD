# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: sergeantspoon <sergeantspoon@archlinux.us>

pkgbase=libssh
pkgname=(libssh
         libssh-docs)
pkgver=0.11.0
pkgrel=2
pkgdesc='Library for accessing ssh client services through C libraries'
url='https://www.libssh.org/'
license=('LGPL-2.1-or-late')
arch=(x86_64)
depends=(glibc
         openssl
         zlib)
makedepends=(cmake
             cmocka
             doxygen
             openssh
             python)
provides=(libssh.so)
source=("https://www.libssh.org/files/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz"{,.asc}
        '0001-config-Do-not-parse-unsupported-ControlPath-ControlMaster.patch')
sha256sums=('860e814579e7606f3fc3db98c5807bef2ab60f793ec871d81bcd23acdcdd3e91'
            'SKIP'
            '1d889c61e199b783be4995140c19b39816dd9eb05026d471d8471ea6b970ccf8')
validpgpkeys=('8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D'  # Andreas Schneider <asn@cryptomilk.org>
              '88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7') # libssh release key (release key) <libssh@libssh.org>

prepare() {
  cd $pkgname-$pkgver

  patch -Np1 < ../0001-config-Do-not-parse-unsupported-ControlPath-ControlMaster.patch
}

build() {
  cmake \
    -B build \
    -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_GSSAPI=OFF \
    -DUNIT_TESTING=ON
  cmake --build build
  cmake --build build --target docs
}

check() {
  cmake --build build --target test
}

package_libssh() {
  DESTDIR="$pkgdir" cmake --install build
}

package_libssh-docs() {
  pkgdesc='Documentation for libssh'
  depends=()
  provides=()

  mkdir -p "$pkgdir"/usr/share/doc/libssh
  cp -r build/doc/html "$pkgdir"/usr/share/doc/libssh
#  cp -r build/doc/man "$pkgdir"/usr/share
#  rm "$pkgdir"/usr/share/man/man3/{bug,deprecated}.*
}
