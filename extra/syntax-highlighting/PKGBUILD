# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=syntax-highlighting
pkgver=6.22.0
pkgrel=1
pkgdesc='Syntax highlighting engine for structured text and code'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(MIT)
depends=(gcc-libs
         glibc
         qt6-base)
makedepends=(doxygen
             extra-cmake-modules
             qt6-declarative
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('50b73ea99413dd988fa34fd169129bcdbfe1dc3b43c48d5f92bbadb2511a728a'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Esk-Riddell <jr@jriddell.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DQRC_SYNTAX=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
