# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libxmu
pkgver=1.2.0
pkgrel=1
pkgdesc="X11 miscellaneous micro-utility library"
arch=('x86_64')
url="https://gitlab.freedesktop.org/xorg/lib/libxmu"
depends=('libxext' 'libxt' 'libx11' 'xorgproto' 'glibc')
makedepends=('xorg-util-macros')
license=('MIT-open-group AND SMLNJ AND X11 AND ISC')
source=(https://xorg.freedesktop.org//archive/individual/lib/libXmu-${pkgver}.tar.xz{,.sig})
sha512sums=('199310c57d9ce15d3a049890ba2b853357fbda267ca0f075624ed4757c72c548a1c4153a4f7492a2ebf06eb90518ef02c21b44ca298933c038c62196f2cddb2e'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

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
