# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libx11
pkgver=1.8.14
pkgrel=1
pkgdesc="X11 client-side library (32-bit)"
arch=(x86_64)
url="https://gitlab.freedesktop.org/xorg/lib/libx11"
depends=('lib32-libxcb' 'libx11' 'lib32-glibc' 'xorgproto')
makedepends=('git' 'xorg-util-macros' 'xtrans' 'gcc-multilib')
license=('MIT' 'X11')
source=(git+https://gitlab.freedesktop.org/xorg/lib/libx11.git?signed#tag=libX11-${pkgver})
sha512sums=('89b5eb8c53e463b1dd0eab5390cc8e4a45cf16123f9b3c495284ec5a8822fb5e65860fe8f4ccf88ddb8b118ee583b82ff774a7e53fe7d60ed8e697d4f0858774')
validpgpkeys=('3AB285232C46AE43D8E192F4DAB0F78EA6E7E2D2') # Alan Coopersmith <alan.coopersmith@oracle.com>
# validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alanc@freedesktop.org>

prepare() {
  cd libx11
  autoreconf -fiv
}

build() {
  export CC="gcc -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd libx11
  ./configure --prefix=/usr \
    --disable-static \
    --disable-xf86bigfont \
    --libdir=/usr/lib32 \
    --disable-specs
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libx11

  make check
}

package() {
  cd libx11
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
