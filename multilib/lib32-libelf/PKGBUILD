# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

_name=elfutils
pkgname=lib32-libelf
pkgver=0.190
pkgrel=1
pkgdesc="Handle ELF object files and DWARF debugging information (libraries) (32-bit)"
arch=(x86_64)
url="https://sourceware.org/elfutils/"
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
source=(https://sourceware.org/elfutils/ftp/$pkgver/elfutils-$pkgver.tar.bz2{,.sig})
sha512sums=('9c4f5328097e028286c42f29e39dc3d80914b656cdfbbe05b639e91bc787ae8ae64dd4d69a6e317ce30c01648ded10281b86a51e718295f4c589df1225a48102'
            'SKIP')
b2sums=('9934aff08f1898377708b28595fb52130ef9f80408132ac7d306845b10672ba45cf1ac69783da07b3eea9fd647741d44da45b8b2626c45a768cb2844c6186513'
        'SKIP')
validpgpkeys=(
  '47CC0331081B8BC6D0FD4DA08370665B57816A6A' # Mark J. Wielaard <mark@klomp.org>
  'EC3CFE88F6CA0788774F5C1D1AA44BE649DE760A' # Mark Wielaard <mjw@gnu.org>
)

prepare() {
  # remove failing test due to missing glibc debug package during test: https://bugs.archlinux.org/task/74875
  sed -e 's/run-backtrace-native.sh//g' -i $_name-$pkgver/tests/Makefile.am

  (
    cd $_name-$pkgver
    autoreconf -fiv
  )

  cp -av $_name-$pkgver $_name-test-$pkgver
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

  (
    # fat-lto-objects is required for non-mangled .a files in libelf
    CFLAGS+=" -ffat-lto-objects"
    cd $_name-$pkgver
    ./configure "${configure_options[@]}"
    make
  )
  (
    # debugging information is required for test-suite
    CFLAGS+=" -g"
    # fat-lto-objects is required for non-mangled .a files in libelf
    CFLAGS+=" -ffat-lto-objects"
    cd $_name-test-$pkgver
    ./configure "${configure_options[@]}"
    make
  )
}

check() {
  make check -C $_name-test-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install -C $_name-$pkgver
  # remove anything that would conflict with elfutils and debuginfod
  rm -rf "$pkgdir/"{etc,usr/{bin,include,share}}
}
