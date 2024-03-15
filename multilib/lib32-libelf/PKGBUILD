# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

_name=elfutils
pkgname=lib32-libelf
pkgver=0.191
pkgrel=1
pkgdesc="Handle ELF object files and DWARF debugging information (libraries) (32-bit)"
arch=(x86_64)
url="https://sourceware.org/elfutils"
license=('GPL-2.0-or-later OR LGPL-3.0-or-later')
depends=(
  lib32-bzip2
  lib32-curl
  lib32-gcc-libs
  lib32-glibc
  lib32-xz
  lib32-zlib
  lib32-zstd
  libelf=$pkgver
)
options=(staticlibs)
# NOTE: the shared objects can not be added to provides as they are not versioned
source=($url/ftp/$pkgver/$_name-$pkgver.tar.bz2{,.sig})
sha512sums=('e22d85f25317a79b36d370347e50284c9120c86f9830f08791b7b6a7b4ad89b9bf4c7c71129133b8d193a0edffb2a2c17987b7e48428b9670aff5ce918777e04'
            'SKIP')
b2sums=('2a7ad251369eca7ba609ab8644181fd479ad8596ee58dc068398ca22be25a978e96b81a10a92a5555d7574fd1b9227c8d54fb41dceb4025aedfc6ae32870bbca'
        'SKIP')
validpgpkeys=(
  'EC3CFE88F6CA0788774F5C1D1AA44BE649DE760A'  # Mark Wielaard <mjw@gnu.org>
  '6C2B631563B8D330578D3CB474FD3FA2779E7073'  # Aaron Merey <amerey@redhat.com>
)

prepare() {
  # remove failing test due to missing glibc debug package during test: https://bugs.archlinux.org/task/74875
  sed -e 's/run-backtrace-native.sh//g' -i $_name-$pkgver/tests/Makefile.am

  cd $_name-$pkgver
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --libdir=/usr/lib32
    --disable-debuginfod
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  # fat-lto-objects is required for non-mangled .a files in libelf
  CFLAGS+=" -ffat-lto-objects"
  # debugging information is required for test-suite
  CFLAGS+=" -g"

  cd $_name-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check() {
  make check -C $_name-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install -C $_name-$pkgver
  # remove anything that would conflict with elfutils and debuginfod
  rm -rf "$pkgdir/"{etc,usr/{bin,include,share}}
}
