# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gdb
# gdb-common is a package that contains files common for all cross compiled versions
# of gdb (for arm/avr/...)
pkgname=(gdb gdb-common)
pkgver=16.1
pkgrel=1
pkgdesc='The GNU Debugger'
arch=(x86_64)
url='https://www.gnu.org/software/gdb/'
license=(GPL-3.0-or-later LGPL-3.0-or-later)
makedepends=(
  bash
  boost
  expat
  gcc-libs
  glibc
  gmp
  guile
  mpfr
  ncurses
  python
  readline
  source-highlight
  texinfo
  xxhash
  xz
  zstd
)
source=(https://ftp.gnu.org/gnu/gdb/${pkgname}-${pkgver}.tar.xz{,.sig})
sha1sums=('e619781131eb79fad764a02cfc0ebe886fd76fcd'
          'SKIP')
b2sums=('d1907a4abffda663e3d383959ee18e1ef91fe913c378cf9681bdf5810bf7e7f065236f722564fd77eebf15700751fed1cef58c25cd0c0c44d1d9a416809f6a66'
        'SKIP')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker

build() {
  cd gdb-$pkgver

  mkdir -p build && cd build
  ../configure \
    --prefix=/usr \
    --disable-nls \
    --enable-source-highlight \
    --enable-tui \
    --enable-targets=all \
    --enable-languages=all \
    --enable-multilib \
    --enable-interwork \
    --with-system-readline \
    --with-python=/usr/bin/python \
    --with-system-gdbinit=/etc/gdb/gdbinit
  make
}

package_gdb-common() {
  depends=(python guile)

  cd gdb-$pkgver/build
  make -C gdb/data-directory DESTDIR="$pkgdir" install
}

package_gdb() {
  depends=(
    bash
    expat
    gcc-libs
    gdb-common=$pkgver
    glibc
    gmp
    guile
    libelf
    liblzma.so
    libmpfr.so
    libncursesw.so
    libreadline.so
    libxxhash.so
    libzstd.so
    mpfr
    ncurses
    python
    readline
    source-highlight
    xxhash
    xz
    zstd
  )
  backup=(etc/gdb/gdbinit)

  cd gdb-$pkgver/build
  make -C gdb DESTDIR="$pkgdir" install
  make -C gdbserver DESTDIR="$pkgdir" install

  # install "custom" system gdbinit
  install -dm 755 "$pkgdir/etc/gdb"
  touch "$pkgdir/etc/gdb/gdbinit"

  # comes from gdb-common
  rm -r "$pkgdir/usr/share/gdb/"
}

# vim: ts=2 sw=2 et:
