# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=calc
pkgver=2.16.1.2
pkgrel=1
pkgdesc="Arbitrary precision console calculator"
arch=('x86_64')
url="http://www.isthe.com/chongo/tech/comp/calc/"
license=('GPL')
depends=('readline')
makedepends=('chrpath'
             'man')
source=("http://www.isthe.com/chongo/src/calc/calc-$pkgver.tar.bz2")
b2sums=('911c097278e74af1446449e68e10e885eae0c46dfba4f9cc58fbe7858eecc2f6259a46f5a6d50af59d535404823ba55f99a5dd6a5aa346e4c25a7be2eb19a075')

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
