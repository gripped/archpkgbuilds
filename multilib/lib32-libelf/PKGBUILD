# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

_name=elfutils
pkgname=lib32-libelf
pkgver=0.193
pkgrel=1
pkgdesc="Handle ELF object files and DWARF debugging information (libraries) (32-bit)"
arch=(x86_64)
url="https://sourceware.org/elfutils"
license=('GPL-2.0-or-later OR LGPL-3.0-or-later')
depends=(
  lib32-bzip2
  lib32-curl
  lib32-glibc
  lib32-json-c
  lib32-xz
  lib32-zlib
  lib32-zstd
  libelf=$pkgver
)
makedepends=(
  lib32-libarchive
  lib32-gcc-libs
)
options=(staticlibs)
# NOTE: the shared objects can not be added to provides as they are not versioned
source=($url/ftp/$pkgver/$_name-$pkgver.tar.bz2{,.sig})
sha512sums=('557e328e3de0d2a69d09c15a9333f705f3233584e2c6a7d3ce855d06a12dc129e69168d6be64082803630397bd64e1660a8b5324d4f162d17922e10ddb367d76'
            'SKIP')
b2sums=('3ddda695e92c76d0f98432b65d51737bdebf9cad536e0a583d10beb4693d98ce6e47716ff143d82dd3488e59489b03170bd292cb165d44bfb8581ff67dd2b1b9'
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
    --build=i686-pc-linux-gnu
    --disable-debuginfod
    --disable-static
    --libdir=/usr/lib32
    --libexecdir=/usr/lib32
    --prefix=/usr
    --program-suffix="-32"
    --sysconfdir=/etc
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
  # fat-lto-objects is required for non-mangled .a files in libelf
  CFLAGS+=" -ffat-lto-objects"
  # debugging information is required for test-suite
  CFLAGS+=" -g"

  cd $_name-$pkgver
  ./configure "${configure_options[@]}"
  make
}

check() {
  # The "dwarf_srclang_check" test introduced in 0.193 needs libelf.so to run.
  # As such, we are passing LD_LIBRARY_PATH so it can find libelf.so from the source built in build()
  # in order to avoid a self (make)dependency.
  make LD_LIBRARY_PATH=$srcdir/$_name-$pkgver/libelf check -C $_name-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install -C $_name-$pkgver/debuginfod
  make DESTDIR="$pkgdir" install -C $_name-$pkgver/libasm
  make DESTDIR="$pkgdir" install -C $_name-$pkgver/libdw
  make DESTDIR="$pkgdir" install -C $_name-$pkgver/libelf
  make DESTDIR="$pkgdir" install -C $_name-$pkgver/config
  # remove anything that would conflict with elfutils and debuginfod
  rm -rf "$pkgdir/"{etc,usr/{bin,include,share}}
}
