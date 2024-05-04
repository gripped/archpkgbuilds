# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxmu
pkgname=lib32-$_pkgbasename
pkgver=1.2.1
pkgrel=1
pkgdesc="X11 miscellaneous micro-utility library (32-bit)"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
depends=('lib32-libxext' 'lib32-libxt' $_pkgbasename)
makedepends=('xorg-util-macros' 'gcc-multilib')
license=('custom')
source=(${url}/releases/individual/lib/libXmu-${pkgver}.tar.xz{,.sig})
sha512sums=('05a30e5961e00e940ad7ec4eb94ec482b5cbe808585972bf70c849333af3fddf4ae4bd87895d706507fb3a94ed0fb73ea161e0e27dc2840323a1a1af49c0e8a3'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E'  # Alan Coopersmith <alan.coopersmith@oracle.com>
              '3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"

build() {
  cd "${srcdir}/libXmu-${pkgver}"

  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --sysconfdir=/etc --disable-static \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/libXmu-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname" 
}
