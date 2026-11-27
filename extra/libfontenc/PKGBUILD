# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libfontenc
pkgver=1.1.10
pkgrel=1
pkgdesc="X11 font encoding library"
arch=('x86_64')
url="https://gitlab.freedesktop.org/xorg/lib/libfontenc"
license=('MIT')
depends=('zlib' 'glibc' 'xorg-fonts-encodings')
makedepends=('git' 'pkgconfig' 'xorgproto' 'xorg-util-macros' 'xorg-font-util')
source=(git+https://gitlab.freedesktop.org/xorg/lib/libfontenc.git?signed#tag=${pkgname}-${pkgver})
sha512sums=('10ff82bf9ab711998d9139ca097549bc3a2a08eb8cc49aa471059459276c20871cb79b47fae3fca7e6dfc0ec45a413c8df45bb778096f90f7f058819be40e045')
#validpgpkeys=('3AB285232C46AE43D8E192F4DAB0F78EA6E7E2D2') # Alan Coopersmith <alan.coopersmith@oracle.com>
#validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # "Peter Hutterer <peter.hutterer@who-t.net>"

prepare() {
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --with-encodingsdir=/usr/share/fonts/encodings      
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
