# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libx11
pkgver=1.8.12
pkgrel=2
pkgdesc="X11 client-side library (32-bit)"
arch=(x86_64)
url="https://gitlab.freedesktop.org/xorg/lib/libx11"
depends=('lib32-libxcb' 'libx11')
makedepends=('xorg-util-macros' 'xorgproto' 'xtrans' 'gcc-multilib')
license=('MIT AND X11')
source=(https://xorg.freedesktop.org/releases/individual/lib/libX11-${pkgver}.tar.xz{,.sig})
sha512sums=('cb7a284d9081a8b67f7d8568d56dc403a4b787e46ac497b07768d236084c01f80f4ea2ebd814f950ac9738adc3baea3912932fc333858195c4f8217744b6f730'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alanc@freedesktop.org>

build() {
  export CC="gcc -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd libX11-${pkgver}
  ./configure --prefix=/usr \
    --disable-static \
    --disable-xf86bigfont \
    --libdir=/usr/lib32 \
    --disable-specs
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

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
