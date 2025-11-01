# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

_name=elfutils
pkgname=lib32-libelf
pkgver=0.194
pkgrel=1
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
sha512sums=('b8b031e1e99466af969792ea9fb2b1c2b0f39425b2eb5bed986fa72189410a4bc5bb8e0e48a57d41fb6bcedba0a5f3c56a4d0c8b66c606feac98c46a303ba379')
b2sums=('a2e84bfaa316f2de5aff212bd91f15bed66f1881e4622fbfc19d671d09be68d2203813743570044de2a1c29c3db18d069db7481ad8cfe71104878cfc9e6f2191')
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
