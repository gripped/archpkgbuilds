# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=calc
pkgver=2.15.0.2
pkgrel=1
pkgdesc="Arbitrary precision console calculator"
arch=('x86_64')
url="http://www.isthe.com/chongo/tech/comp/calc/"
license=('GPL')
depends=('readline')
makedepends=('chrpath')
source=("http://www.isthe.com/chongo/src/calc/calc-$pkgver.tar.bz2")
b2sums=('dfefa96fae318e5b6a575c30e07a6327aedac2b7073d6411f6f40a9fc1a5c13460c023e508f7977dc6a30cff6d3e346626e7f3d3a4d522ae89f23ec641ecd387')

prepare() {
  cd "$srcdir/calc-$pkgver"

  sed -i 's/${CC} ${LIBCALC_SHLIB}/${CC} ${LDFLAGS} ${LIBCALC_SHLIB}/' Makefile
  sed -i 's/${CC} ${LIBCUSTCALC_SHLIB}/${CC} ${LDFLAGS} ${LIBCUSTCALC_SHLIB}/' custom/Makefile
}

build() {
  cd "$srcdir/calc-$pkgver"

  make USE_READLINE="-DUSE_READLINE" \
       READLINE_LIB="-lreadline" \
       READLINE_EXTRAS="-lhistory -lncurses" \
       EXTRA_CFLAGS="$CPPFLAGS $CFLAGS" \
       EXTRA_LDFLAGS="$LDFLAGS" \
       ARCH_CFLAGS='' \
       LD_SHARE='' \
       DEBUG=''
}

package() {
  cd "$srcdir/calc-$pkgver"

  make T="$pkgdir" install
  mv "$pkgdir/usr/bin/cscript" "$pkgdir/usr/share/calc/"
  chrpath -d "$pkgdir/usr/bin/calc"
}
