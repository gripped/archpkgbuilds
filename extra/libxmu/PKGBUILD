# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libxmu
pkgver=1.3.0
pkgrel=1
pkgdesc="X11 miscellaneous micro-utility library"
arch=('x86_64')
url="https://gitlab.freedesktop.org/xorg/lib/libxmu"
depends=('libxext' 'libxt' 'libx11' 'xorgproto' 'glibc')
makedepends=('xorg-util-macros')
license=('MIT-open-group AND SMLNJ AND X11 AND ISC')
source=(https://xorg.freedesktop.org//archive/individual/lib/libXmu-${pkgver}.tar.xz{,.sig})
sha512sums=('38bad3d975017fada13e90ae13ef8db4cb1ed5063cd3b3ae0acddfa77443265e33d0d3397cd070a0c78d92281d16445944e3f19828ff467c21da69db0249f3fa'
            'SKIP')
validpgpkeys=('3AB285232C46AE43D8E192F4DAB0F78EA6E7E2D2') # "Alan Coopersmith <alan.coopersmith@oracle.com>"
# validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"

build() {
  cd libXmu-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static
  make
}

package() {
  cd libXmu-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
