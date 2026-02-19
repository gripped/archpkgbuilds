# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=tellico
pkgver=4.1.5
pkgrel=1
pkgdesc="A collection manager for KDE"
arch=('x86_64')
url="https://tellico-project.org/"
license=('GPL')
depends=('exempi' 'hicolor-icon-theme' 'kio' 'libksane' 'libkcddb'
         'libcdio' 'kfilemetadata' 'knewstuff' 'kxmlgui' 'kitemmodels'
         'perl-text-bibtex' 'python' 'solid' 'yaz' 'taglib' 'poppler-qt6' 'qt6-base' 'qt6-charts' 'qt6-webengine')
makedepends=('cmake' 'extra-cmake-modules' 'kdoctools')
changelog=$pkgname.changelog
source=(https://tellico-project.org/files/$pkgname-$pkgver.tar.xz)
sha256sums=('de85c600a725926000308622d96ee7bed1123af07f971f237841fb4a02240b36')

build() {
  cmake -B build -S $pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -Wno-dev \
        -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
