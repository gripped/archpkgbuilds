# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=4.0.3
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
sha512sums=('520d4104b7e2fb3ca1d41cf7918dc5e6237d3651cb6f201207f64957fe42fe9cd0adbcd22b1e15c6acd0826c93d26de29dc1121c3ede5093bbc2725013b80b9a')

build() {
  cmake -S $pkgname -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DLIBICAL_GOBJECT_INTROSPECTION=true \
    -DLIBICAL_GLIB_VAPI=true \
    -DCMAKE_DISABLE_FIND_PACKAGE_BerkeleyDB=true
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
