# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=oxygen-icons
pkgname=(oxygen-icons
         oxygen-icons-svg)
pkgver=6.30.0
epoch=1
pkgrel=1
pkgdesc='The Oxygen Icon Theme'
arch=(any)
url='https://develop.kde.org/products/frameworks/'
license=(LGPL-2.1-or-later)
makedepends=(extra-cmake-modules
             qt6-base)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('8ae13c8827883d54cf903f63fbc9eff246b3a4dd8c0d7c835b610d642f49f37e'
            'SKIP')
validpgpkeys=('39FFA93CAE9C6AFC212AD00202325448204E452A' # Carl Schwan <carl@carlschwan.eu>
              '90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1' # Nicolas Fella
)

build() {
  cmake -B build -S $pkgbase-$pkgver
  cmake --build build
}

package_oxygen-icons() {
  DESTDIR="$pkgdir" cmake --install build
}

package_oxygen-icons-svg() {
  pkgdesc='The Oxygen Icon Theme (Scalable Vector Graphics)'

  cd $pkgbase-$pkgver
  find scalable -type f ! -name '*.sh' -exec \
    install -D -m644 "{}" "$pkgdir"/usr/share/icons/oxygen/{} \;
}
