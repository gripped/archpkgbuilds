# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: josephgbr <rafael.f.f1 at gmail.com>

_pkgbase=libtasn1
pkgname=lib32-${_pkgbase}
pkgver=4.20.0
pkgrel=1
pkgdesc="The ASN.1 library used in GNUTLS (32 bit)"
arch=('x86_64')
license=('GPL-3.0-or-later AND LGPL-2.1-or-later')
url="https://www.gnu.org/software/libtasn1/"
depends=('lib32-glibc' ${_pkgbase})
makedepends=('gcc-multilib')
provides=('libtasn1.so')
source=(https://ftp.gnu.org/gnu/libtasn1/${_pkgbase}-${pkgver}.tar.gz{,.sig})
sha256sums=('92e0e3bd4c02d4aeee76036b2ddd83f0c732ba4cda5cb71d583272b23587a76c'
            'SKIP')
validpgpkeys=('B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE') # "Simon Josefsson <simon@josefsson.org>"

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${_pkgbase}-${pkgver}

  ./configure --prefix=/usr \
      --libdir=/usr/lib32 \
      --with-packager=Archlinux \
      --with-packager-bug-reports="https://gitlab.archlinux.org/archlinux/packaging/packages/$pkgname/-/issues" \
      --with-packager-version=${pkgver}-${pkgrel}
  make
}

package() {
  cd ${_pkgbase}-${pkgver}

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
