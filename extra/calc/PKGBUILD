# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=calc
pkgver=2.16.1.1
pkgrel=1
pkgdesc="Arbitrary precision console calculator"
arch=('x86_64')
url="http://www.isthe.com/chongo/tech/comp/calc/"
license=('GPL')
depends=('readline')
makedepends=('chrpath'
             'man')
source=("http://www.isthe.com/chongo/src/calc/calc-$pkgver.tar.bz2")
b2sums=('3bf0edd1743f541df94a5f603b3af882a2f1ba3fdc38854ee3591872f508d8c4cb8e81ae16ce0101607837d4ae04d5b95e6d5e3c832802957c4a121e08ca341f')

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
