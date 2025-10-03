# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-svg
_pkgver=6.9.2
pkgver=${_pkgver/-/}
pkgrel=2
arch=(x86_64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='Classes for displaying the contents of SVG files'
depends=(gcc-libs
         glibc
         qt6-base
         zlib)
makedepends=(cmake
             git
             ninja)
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver)
sha256sums=('bed76c438a3060a7ad09b2ce2c7a83ca73115dc6e97b032468c99e9f5a3108fb')

prepare() {
  cd $_pkgfn
# CVE fixes
  git cherry-pick -n ea44b50c6e61104cadd6b7c8ede92a4108634232 \
                     6a6273126770006232e805cf1631f93d4919b788
}

build() {
  cmake -B build -S $_pkgfn -G Ninja \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}
