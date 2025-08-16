# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

_name=elfutils
pkgname=lib32-libelf
pkgver=0.193
pkgrel=4
pkgdesc="Handle ELF object files and DWARF debugging information (libraries, 32-bit)"
arch=(x86_64)
url="https://sourceware.org/elfutils/"
_url=https://sourceware.org/git/elfutils.git
license=('GPL-2.0-or-later OR LGPL-3.0-or-later')
depends=(
  "libelf=$pkgver"
  lib32-bzip2
  lib32-curl
  lib32-glibc
  lib32-json-c
  lib32-xz
  lib32-zlib
  lib32-zstd
)
makedepends=(
  git
  lib32-libarchive
  lib32-gcc-libs
)
# NOTE: the shared objects can not be added to provides as they are not versioned
source=(git+$_url?signed#tag=$_name-$pkgver)
sha512sums=('44e60727d96c9eb969b0056cb5eb0dff91b2763f8e835404ab4485914b346f93f56756a6f5ea3af706ff15c4052eae77c5ea6544bcd0cf78b3dc9b2dd33bb884')
b2sums=('7f8386a37452d46c40b7428d841c43afedf24055390ddd8881410cd96928ccfc979628a1d8dbd7e9a0dd3098cc1d826f238f33c995902fc22e175899ea7d8086')
validpgpkeys=(
  'EC3CFE88F6CA0788774F5C1D1AA44BE649DE760A'  # Mark Wielaard <mjw@gnu.org>
  '6C2B631563B8D330578D3CB474FD3FA2779E7073'  # Aaron Merey <amerey@redhat.com>
)

prepare() {
  cd $_name

  # remove failing test due to missing glibc debug package during test: https://bugs.archlinux.org/task/74875
  sed -e 's/run-backtrace-native.sh//g' -i tests/Makefile.am

  autoreconf -fiv
}

build() {
  local configure_options=(
    --build=i686-pc-linux-gnu
    --prefix=/usr
    --sysconfdir=/etc
    --libdir=/usr/lib32
    --program-prefix="eu-"
    --program-suffix="-32"
    --enable-deterministic-archives
    --enable-maintainer-mode
    --disable-debuginfod
    --disable-static
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  # debugging information is required for test-suite
  CFLAGS+=" -g"

  cd $_name
  ./configure "${configure_options[@]}"
  make
}

check() {
  # The "dwarf_srclang_check" test introduced in 0.193 needs libelf.so to run.
  # As such, we are passing LD_LIBRARY_PATH so it can find libelf.so from the
  # source built in build() in order to avoid a self (make)dependency.
  LD_LIBRARY_PATH="$PWD/$_name/libelf" make -C $_name check
}

package() {
  make DESTDIR="$pkgdir" install -C $_name

  # remove anything that would conflict with elfutils' packages
  rm -rf "$pkgdir/"{etc,usr/{bin,include,share}}
}

# vim:set sw=2 sts=-1 et:
