# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=calc
pkgver=2.17.0.0
pkgrel=1
pkgdesc="Arbitrary precision console calculator"
arch=(x86_64)
url="https://github.com/lcn2/calc"
license=(LGPL-2.1-only)
depends=(readline)
makedepends=(mandoc)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lcn2/${pkgname}/archive/v${pkgver}.tar.gz)
b2sums=('14ebacf4ee33fec40fdda380d3f528533d27ac21f6f487f776c8435339c21b34f9c91682b994af5af50941ffcea39a01f22237c56733e14fcc745f03bc909b82')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i 's/${CC} ${LIBCALC_SHLIB}/${CC} ${LDFLAGS} ${LIBCALC_SHLIB}/' Makefile
  sed -i 's/${CC} ${LIBCUSTCALC_SHLIB}/${CC} ${LDFLAGS} ${LIBCUSTCALC_SHLIB}/' custom/Makefile
}

build() {
  cd "${pkgname}-${pkgver}"

  make \
    USE_READLINE="-DUSE_READLINE" \
    READLINE_LIB="-lreadline" \
    READLINE_EXTRAS="-lhistory -lncurses" \
    EXTRA_CFLAGS="${CPPFLAGS} ${CFLAGS} -Wno-error=format-security" \
    EXTRA_LDFLAGS="${LDFLAGS}" \
    ARCH_CFLAGS="" \
    LD_SHARE="" \
    DEBUG=""
}

check() {
  cd "${pkgname}-${pkgver}"

  make chk
}

package() {
  cd "${pkgname}-${pkgver}"

  make \
    T="${pkgdir}" install

  # `cscript` is a directory of example calc scripts, not a binary. Move it to
  # the correct location.
  mv "${pkgdir}/usr/bin/cscript" "${pkgdir}/usr/share/calc/"
}
