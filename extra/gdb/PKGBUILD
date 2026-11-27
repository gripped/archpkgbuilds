# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gdb
# gdb-common is a package that contains files common for all cross compiled versions
# of gdb (for arm/avr/...)
pkgname=(gdb gdb-common)
pkgver=18.1
pkgrel=2
pkgdesc='The GNU Debugger'
arch=(x86_64)
url='https://www.gnu.org/software/gdb/'
license=(GPL-3.0-or-later LGPL-3.0-or-later)
makedepends=(
  bash
  boost
  expat
  glibc
  gmp
  guile
  libgcc
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
source=(https://ftp.gnu.org/gnu/gdb/${pkgname}-${pkgver}.tar.xz{,.sig}
        gdb-18.1-fix-crashes.patch)
sha1sums=('129db232e869bc23c37fef6be54710728e8f7e39'
          'SKIP'
          '00a01dd414efe60621506c6b79d7f7f7ec2d67c8')
b2sums=('9cf68cd96ecd1b2f51235f80f30d4024eadea7e11fe8af1cde0103176c622b770d79fde2205739fad8fe314ffecddd450626976e1897b04899027d0d88f30e1d'
        'SKIP'
        'b9bf66a9d1c956c3f490a92f362f0dfa2ce03668417d28f3fb8a54a67c628690d3252fcaf7c17248d9d9791409548b28d89815ba006ec9d3540cb916d129f813')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker

prepare() {
  cd gdb-$pkgver
  # fix crashes whenusing debuginfod https://sourceware.org/bugzilla/show_bug.cgi?id=34707
  patch -p1 -i ../gdb-18.1-fix-crashes.patch
}

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
    boost-libs
    expat
    libgcc
    libstdc++
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
