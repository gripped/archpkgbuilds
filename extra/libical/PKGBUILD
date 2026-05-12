# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=4.0.0
pkgrel=2
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
sha512sums=('cfbb6ee330017b17f4165885764e311e6661402284a5b49d08a67b73eeae15a40782f0a15bcc3bcf6af5273778893e964d2106beafb308049b7fcc59769ac9ea')

prepare() {
  cd $pkgname
  git cherry-pick -n 7bb06c99d8ced01c3d84ca4151b4b7d351999eff # Fix tests in gnome-calendar
}

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
