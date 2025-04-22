# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=clisp
pkgver=2.49.95
pkgrel=2
pkgdesc="ANSI Common Lisp interpreter, compiler and debugger"
arch=('x86_64')
license=('GPL-2.0-only')
url="https://clisp.sourceforge.io/"
depends=('readline' 'libsigsegv' 'ffcall' 'libxcrypt' 'libunistring')
provides=('common-lisp')
makedepends=('git')
options=('!makeflags' '!emptydirs')
_rev=afa64df1c2bd92175159e8065117ec7286c65522
source=("$pkgname::git+https://gitlab.com/gnu-clisp/clisp#commit=$_rev")
sha512sums=('c93e403b768e5d6e842a86835da8ccd905cc2d5461671b7b0a47def0d0a96c91cffc9c0344eef75a999f4cbddf12f191f1c42f410ebf09277d7e338dc8ffa3d6')
b2sums=('5a9ed2744db2efebbc63218b6f51ddff7087c985a97f8720d8ec66ba771e86e4c887a9955ce20b9226706ce73b12b45cd3e9d184b33fb282e8ba04e0dab76957')

build() {
  cd $pkgname
  CFLAGS+=" -ffat-lto-objects" \
  ./configure --prefix=/usr --with-readline --with-ffcall --with-threads=POSIX_THREADS src

  cd src
  ./makemake --prefix=/usr --with-readline --with-ffcall --with-dynamic-ffi > Makefile
  make
}

check() {
  cd $pkgname
  make check || :
}

package() {
  cd $pkgname/src
  make DESTDIR="$pkgdir" install
}
