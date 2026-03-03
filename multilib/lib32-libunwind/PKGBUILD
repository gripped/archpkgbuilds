# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=lib32-libunwind
pkgver=1.8.2
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
b2sums=('b198b186c616adf1302d153a12949ceab07608f8133e42454e6b10bdf9518a514ef15d5ba52ef75b11e5f73fa330205accd415cfc30e6fa3ddd9724cbb088737'
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
