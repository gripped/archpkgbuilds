# Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libx11
pkgname=lib32-$_pkgbasename
pkgver=1.8.7
pkgrel=1
pkgdesc="X11 client-side library (32-bit)"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
depends=('lib32-libxcb' $_pkgbasename)
makedepends=('xorg-util-macros' 'xorgproto' 'xtrans' 'gcc-multilib')
license=('custom:XFREE86')
source=(${url}/releases/individual/lib/libX11-${pkgver}.tar.xz{,.sig})
sha512sums=('d53bfc18f38d339a6a695b09835b2ae96b323881678bfe7ddca697605e3bdf4102ff49cc3078880a6c55b5977fcdd0aadaf5429086132de3a5bda302f79a2fa6'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alanc@freedesktop.org>
validpgpkeys+=('C41C985FDCF1E5364576638B687393EE37D128F8') # Matthieu Herrb <matthieu.herrb@laas.fr>
validpgpkeys+=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>
validpgpkeys+=('995ED5C8A6138EB0961F18474C09DD83CAAA50B2') # Adam Jackson <ajax@nwnk.net>
#validpgpkeys+=('C383B778255613DFDB409D91DB221A6900000011') # "Keith Packard <keithp@keithp.com>"

build() {
  export CC="gcc -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd libX11-${pkgver}
  ./configure --prefix=/usr --disable-static --disable-xf86bigfont --disable-thread-safety-constructor \
      --libdir=/usr/lib32 --disable-specs
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libX11-${pkgver}

  make check
}

package() {
  cd libX11-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
