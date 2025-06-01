# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=identify
pkgname=python-identify
pkgver=2.6.12
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
sha512sums=('54f979248629435fadaf991c66855c9fa78a26e4f09e29798643b69c2a6c4f4d436c19cdd2dfc3b11dc4776c1d8e83eb199317e00104e1eadd9aaf60a8235a0a')
b2sums=('bf8b9faf5b045d616c6c67051b218bda4b50cc0fc929a45e594fd831408f2a24976d79ebed40c36096dd63c01dfc7fa8a0a9eb4c06f5e3b23e4d9e6ba7523f3c')

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
