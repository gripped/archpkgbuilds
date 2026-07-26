# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=libical
pkgname=(libical
         libical-docs)
pkgver=4.0.4
pkgrel=1
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=(x86_64)
url='https://github.com/libical/libical'
license=('LGPL-2.1-only' 'MPL-2.0')
depends=(glib2
         glibc
         icu
         libgcc
         libstdc++
         libxml2)
makedepends=(cmake 
             doxygen
             gi-docgen
             git
             gobject-introspection
             jdk-openjdk
             vala)
checkdepends=(python-gobject)
source=(git+https://github.com/libical/libical#tag=v$pkgver)
sha512sums=('fc33b72da9e2ba66f440dd538b25629c72b9812f3bfa7d7a1533b32c003b3fae9e211612912d81bf284c9ecb9207d88e231b2d6ae77e04839dd32e3dc98c28c8')

build() {
  cmake -S $pkgname -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DLIBICAL_BUILD_TESTING=true \
    -DLIBICAL_GOBJECT_INTROSPECTION=true \
    -DLIBICAL_GLIB_VAPI=true \
    -DCMAKE_DISABLE_FIND_PACKAGE_BerkeleyDB=true
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure -j$(nproc)
}

package_libical() {
  DESTDIR="${pkgdir}" cmake --install build

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libical-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}
