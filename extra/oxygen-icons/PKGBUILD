# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=oxygen-icons
pkgname=(oxygen-icons
         oxygen-icons-svg)
pkgver=6.32.0
epoch=1
pkgrel=2
pkgdesc='The Oxygen Icon Theme'
arch=(any)
url='https://develop.kde.org/products/frameworks/'
license=(LGPL-2.1-or-later)
makedepends=(extra-cmake-modules
             qt6-base)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('743b5277c63592d84a51a643e5381d6afbc5c7563ff775faae6005311d1bfccd'
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

# Fix broken icon names
  for _size in 22 24 48; do
    mv "$pkgdir"/usr/share/icons/oxygen/simbolicActions/${_size}x${_size}/actions/go-first{" copy",-copy}.svg
  done
}

package_oxygen-icons-svg() {
  pkgdesc='The Oxygen Icon Theme (Scalable Vector Graphics)'

  cd $pkgbase-$pkgver
  find scalable -type f ! -name '*.sh' -exec \
    install -D -m644 "{}" "$pkgdir"/usr/share/icons/oxygen/{} \;
}
