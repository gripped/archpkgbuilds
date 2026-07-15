# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kapidox
pkgver=6.28.0
pkgrel=1
pkgdesc='Frameworks API Documentation Tools'
arch=(any)
url='https://develop.kde.org/products/frameworks/'
license=(LGPL)
depends=(python-jinja
         python-yaml)
makedepends=(python-build
             python-installer
             python-wheel
             python-setuptools
             qt6-base)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('b105b6e2457491969019a4d87e98c03accf07148dc56e26210372d59aa9a4488'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
