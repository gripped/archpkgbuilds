# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_pkgbasename=libxcursor
pkgname=lib32-$_pkgbasename
pkgver=1.2.2
pkgrel=1
pkgdesc="X cursor management library (32-bit)"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('lib32-libxfixes' 'lib32-libxrender' $_pkgbasename)
makedepends=('xorg-util-macros')
source=(${url}/releases/individual/lib/libXcursor-${pkgver}.tar.xz{,.sig})
sha256sums=('53d071bd2cc56e517a30998d5e685c8a74556ddada43c6985d14da9a023a88ee'
            'SKIP')
validpgpkeys=('C41C985FDCF1E5364576638B687393EE37D128F8'  # "Matthieu Herrb <matthieu.herrb@laas.fr>"
              '4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd "${srcdir}/libXcursor-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/libXcursor-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
