# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=lib32-libunwind
pkgver=1.8.1
pkgrel=1
pkgdesc="Determine and manipulate the call-chain of a program (32-bit)"
url="https://www.nongnu.org/libunwind/"
arch=(x86_64)
license=(GPL)
depends=(
  lib32-glibc
  lib32-xz
  lib32-zlib
  libunwind
)
makedepends=()
provides=(
  libunwind-{coredump,ptrace,setjmp,x86}.so
  libunwind.so
)
source=(
  https://github.com/libunwind/libunwind/releases/download/v$pkgver/libunwind-$pkgver.tar.gz{,.asc}
)
b2sums=('936e70f2428d8f6ada3b4d58b3c9e3a9738eb2f7aee1ad5fb4e44dbb7400186d1bd1ead86a698e53d199d5944b102f8380d08b48104a138021286a79fb006ec3'
        'SKIP')
validpgpkeys=(
  F86EB09F72717426F20D36470A0FF845B7DB3427  # Stephen M. Webb <stephen.webb@bregmasoft.ca>
)

prepare() {
  cd libunwind-$pkgver
}

build() {
  local configure_options=(
    --build=$CHOST
    --host=i686-pc-linux-gnu
    --prefix=/usr
    --libdir=/usr/lib32
    --sysconfdir=/etc
    --localstatedir=/var
    --disable-documentation
    --disable-tests
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd libunwind-$pkgver
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libunwind-$pkgver
  # Tests fail on i686: https://github.com/libunwind/libunwind/issues/393
  make check || :
}

package() {
  cd libunwind-$pkgver
  make DESTDIR="$pkgdir" install

  # we need one specific include file for the i686 platform
  find "$pkgdir/usr/include" -type f -not -name "*x86*" -exec rm {} \;
}

# vim:set sw=2 sts=-1 et:
