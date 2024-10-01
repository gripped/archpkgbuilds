# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=tellico
pkgver=4.0.1
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
sha256sums=('c8945b9425ec09e8ee4e5eeab0f2618769e186026823677fe2cb4cf41a68cd24')

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
