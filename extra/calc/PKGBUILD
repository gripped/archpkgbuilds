# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=calc
pkgver=2.15.0.7
pkgrel=1
pkgdesc="Arbitrary precision console calculator"
arch=('x86_64')
url="http://www.isthe.com/chongo/tech/comp/calc/"
license=('GPL')
depends=('readline')
makedepends=('chrpath'
             'man')
source=("http://www.isthe.com/chongo/src/calc/calc-$pkgver.tar.bz2")
b2sums=('f56d127a037bb60b412a4f113a7ff216b0b93500f35b85a0d7242081fc686e7114206a60e181c6b11ee7090e87efeae2381ed21281a1d6f1d4bf57f923646c0d')

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
