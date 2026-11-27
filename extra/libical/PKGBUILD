# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=libical
pkgname=(libical
         libical-docs)
pkgver=4.0.8
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
sha512sums=('adf6d9c248d3f523d94fb3bfac462912306477af7406699341c6175b63bdc64d8c45dc84ded4395840ae3924f3ae63818bef1d6d637b9849b91d92a97f5d1b71')

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
