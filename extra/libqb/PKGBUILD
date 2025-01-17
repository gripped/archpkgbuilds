# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: ovi chis <ovi@ovios.org>

pkgname=libqb
pkgver=2.0.8
pkgrel=1
pkgdesc='Library for providing high performance, reusable features for client-server architecture'
url='https://github.com/ClusterLabs/libqb'
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=('glibc')
makedepends=('doxygen' 'splint')
checkdepends=('check')
provides=('libqb.so')
source=(https://github.com/ClusterLabs/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz{,.asc})
sha512sums=('c4df06c844685ff12975bf2aa9c17778244bbf208a63ef483c5aa1c160cd4d9f9606a2a643de89698b17013b308a5a72dfb1e1d347a8d63ebdf3076c64a325c6'
            'SKIP')
validpgpkeys=(
  'C5E29348A2B634E9F71B2014791890532CB5CDDE' # libqb Release Signing Key <users@clusterlabs.org>
  '746F4C0CA8C2B82ECC0A694808C81B2C6CE95CA7' # Cluster Release Team <cluster-devel@redhat.com>
)

prepare() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --disable-fatal-warnings \
    --disable-static \
    --libdir=/usr/lib \
    --sbindir=/usr/bin \
    --localstatedir=/var
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make -C tests VERBOSE=1 check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
