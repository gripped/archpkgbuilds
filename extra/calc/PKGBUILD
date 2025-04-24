# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=calc
pkgver=2.15.1.1
pkgrel=1
pkgdesc="Arbitrary precision console calculator"
arch=('x86_64')
url="http://www.isthe.com/chongo/tech/comp/calc/"
license=('GPL')
depends=('readline')
makedepends=('chrpath'
             'man')
source=("http://www.isthe.com/chongo/src/calc/calc-$pkgver.tar.bz2")
b2sums=('92f4e6ab379f9ccad15ad626617e38899dc40a621bdcf64e0736eda8a4aae95432f58ba24dfd00b6e8e829ae843db45f0cbe12e6265e460d671ef8ed51a50f08')

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
