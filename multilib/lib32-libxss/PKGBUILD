# Maintainer: Florian Pritz <flo@xssn.at>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_pkgbasename=libxss
pkgname=lib32-$_pkgbasename
pkgver=1.2.4
pkgrel=1
pkgdesc="X11 Screen Saver extension library (32-bit)"
arch=(x86_64)
license=('custom')
url="https://gitlab.freedesktop.org/xorg/lib/libxscrnsaver"
depends=('lib32-libxext' $_pkgbasename)
makedepends=('xorg-util-macros' gcc-multilib)
source=("https://xorg.freedesktop.org/releases/individual/lib/libXScrnSaver-${pkgver}.tar.xz"{,.sig})
sha512sums=('e4395af85f8496618afb23ffdaca1a75f5e3d213478d8dc73249cbc9840d7b993ba7513dbf6015cb38b48fe3f2223496365158a148dd5e1ac7475c5ee569e28c'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/libXScrnSaver-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/libXScrnSaver-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
