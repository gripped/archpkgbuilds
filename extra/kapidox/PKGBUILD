# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kapidox
pkgver=6.0.0
pkgrel=1
pkgdesc='Frameworks API Documentation Tools'
arch=(any)
url='https://community.kde.org/Frameworks'
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
sha256sums=('e4cd452fe796b29536c30b5256e0f8ea82dcadefdcb29ce282f2c1eaea3764bb'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB  # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D) # Jonathan Esk-Riddell <jr@jriddell.org>

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
