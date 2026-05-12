# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

_name=elfutils
pkgname=lib32-libelf
pkgver=0.195
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
source=(git+$_url?signed#tag=$_name-$pkgver
        "remove-comment.patch")
sha512sums=('7bbc1db55939e999683ccff41f287433ed926e255b4a35048812bc85505a1b3339828691691c769c4d79347f513792356c2d6b1727eabe0fd720722f7076643e'
            'e33fe8d3fc9347fc9839c3958e51f8dbb7fbe4670b44ede503f5e8237998c80c4d53dfb7a6f36bc33d552ee35aaa955f7323a60476f315afd4fbee052a6551a1')
b2sums=('6be17af5c5d015e028f1658f63a5a635c00952c98fa76be4f5a56c27366681a56f8e288261db876c51bc884a8a3fc4d03ecdf965e0e0fc98a2ebb3d4351d2d1c'
        'c48aba30e2890744700982a49fef69bae94e1db0036fb25c0168c18ebbe8baf2f7ab49e46c384506ef7d35d4bebb028241112103f2be474c717f292d9a4c003b')
validpgpkeys=(
  'EC3CFE88F6CA0788774F5C1D1AA44BE649DE760A'  # Mark Wielaard <mjw@gnu.org>
  '6C2B631563B8D330578D3CB474FD3FA2779E7073'  # Aaron Merey <amerey@redhat.com>
)

prepare() {
  cd $_name

  # remove failing test due to missing glibc debug package during test: https://bugs.archlinux.org/task/74875
  sed -e 's/run-backtrace-native.sh//g' -i tests/Makefile.am

  # Accidental comment in the AWK file. Removing it.
  patch -Np1 < "$srcdir/remove-comment.patch"

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
