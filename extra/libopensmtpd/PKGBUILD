# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=libopensmtpd
pkgver=1.0
pkgrel=1
pkgdesc="Library for creating OpenSMTPD filters"
license=(BSD)
url="https://imperialat.at/dev/libopensmtpd/"
arch=(x86_64)
depends=(libevent)
makedepends=(gzip mandoc)
source=(https://src.imperialat.at/releases/${pkgname}-${pkgver}.tar.gz)
sha512sums=('e42bfcc6ec5c8b54c397c7b8e7200cfb515ac3c1e4f47634b68bebb7600c15c84a47c9d2d89ea6c987ab506fe26e12f29e6c665ccd326ea9f21462760f5a4d18')

build() {
  cd ${pkgname}-${pkgver}
  make -f Makefile.gnu
}

package() {
  cd ${pkgname}-${pkgver}
  make -f Makefile.gnu DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
