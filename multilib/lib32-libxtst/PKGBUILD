# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxtst
pkgname=lib32-$_pkgbasename
pkgver=1.2.6
pkgrel=1
pkgdesc="X11 Testing -- Resource extension library (32-bit)"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('MIT-open-group' 'HPND-sell-variant' 'X11' 'HPND-doc' 'HPND-doc-sell')
depends=('lib32-libxext' 'lib32-libxi' 'lib32-libxfixes' $_pkgbasename)
makedepends=('gcc-multilib' 'git' 'xorg-util-macros')
source=(git+https://gitlab.freedesktop.org/xorg/lib/libXtst.git?signed#tag=libXtst-${pkgver})
sha256sums=('930db33ad21b1df83cc58098118d81d5a0969155a83ecbb3fdaa31eb498c1ed4')
validpgpkeys=('3AB285232C46AE43D8E192F4DAB0F78EA6E7E2D2') # Alan Coopersmith <alan.coopersmith@oracle.com>

prepare() {
  cd libXtst
  autoreconf -vfi
}

build() {
  cd libXtst

  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --disable-static \
    --libdir=/usr/lib32
  make
}

package() {
  cd libXtst

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
