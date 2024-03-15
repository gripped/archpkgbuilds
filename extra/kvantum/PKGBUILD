# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgbase=kvantum
pkgname=(kvantum
         kvantum-qt5)
pkgver=1.0.10
pkgrel=3
pkgdesc='SVG-based theme engine for Qt6 (including config tool and extra themes)'
arch=(x86_64)
url='https://github.com/tsujan/Kvantum'
license=(GPL-3.0-or-later)
depends=(gcc-libs
         glibc
         libx11)
makedepends=(cmake
             kwindowsystem5
             qt5-svg
             qt5-tools
             qt5-x11extras
             qt6-svg
             qt6-tools)
source=(https://github.com/tsujan/Kvantum/releases/download/V$pkgver/Kvantum-$pkgver.tar.xz{,.asc})
sha256sums=('4a070a1a6fac3d1861010aa44d34e665e4697bc64c4c5015a6448203c31f1f1f'
            'SKIP')
validpgpkeys=(19DFDF3A579BD509DBB572D8BE793007AD22DF7E) # Pedram Pourang <tsujan2000@gmail.com>

prepare() {
  # Fix Qt6 build with Qt5 installed
  sed -e 's|Qt6 Qt5|Qt6|' -i Kvantum-$pkgver/Kvantum/*/CMakeLists.txt
  # Build manager with Qt6
  sed -e 's|if(ENABLE_QT5)|if(TRUE)|' -i Kvantum-$pkgver/Kvantum/CMakeLists.txt
}

build() {
  cmake -B build5 -S Kvantum-$pkgver/Kvantum \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build5

  cmake -B build6 -S Kvantum-$pkgver/Kvantum \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT5=OFF
  make -C build6
}

package_kvantum() {
  depends+=(qt6-base
            qt6-svg)
  optdepends=('kvantum-qt5: Qt5 style')

  DESTDIR="$pkgdir" cmake --install build6
}

package_kvantum-qt5() {
  pkgdesc='SVG-based theme engine for Qt5'
  depends+=(kvantum
            kwindowsystem5
            qt5-base
            qt5-svg
            qt5-x11extras)

  DESTDIR="$pkgdir" cmake --install build5/style
}
