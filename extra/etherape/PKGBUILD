# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=etherape
pkgver=0.9.21
pkgrel=2
pkgdesc='Graphical network monitor for various OSI layers and protocols'
url='http://etherape.sourceforge.net/'
arch=('x86_64')
license=('GPL2')
depends=('glibc' 'glib2' 'libpcap' 'popt' 'cairo' 'gdk-pixbuf2' 'gtk3' libpcap.so)
makedepends=('yelp-tools')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('0fccf216eff11aae69fa59da810f3c6364e0e94ea8ec538a73a9ba25d7f66d1269bfa7f55b94d5559098a036a4ba85910e373f2815da9f68252536a5e9a783ea')
b2sums=('840a8ffb7173d85973f9ee42e2433020924682d11d4ad51de5ab90128bece92e3c1b682be90b87c6cf628f72dc41ddc6841e804ae947d0d286679729b26224d8')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's/goocanvas-2.0/goocanvas-3.0/' configure.ac
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
