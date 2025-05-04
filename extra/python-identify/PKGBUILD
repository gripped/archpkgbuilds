# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=identify
pkgname=python-identify
pkgver=2.6.10
pkgrel=1
pkgdesc="File identification library for Python"
arch=(any)
url="https://github.com/pre-commit/identify"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-ukkonen
)
optdepends=(
  'python-ukkonen: for returning license identifiers'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('97620cf3ffbf96ee167adf0ffe30c91fff902c64898ad5c733b441e96575172cfeae29e37602db9f7de80ad8a3dd08e8d4389a6b1ec5a9c14873a13e9f9b4a72')
b2sums=('a4b4db9ea573cfd11762714ed4fe40d64be6ce812d2eabe227ef60a0583176b0efd52261c6d60b02fa9d7f7288be35366fd887f7f41e225c64b77b68580fd7f2')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
