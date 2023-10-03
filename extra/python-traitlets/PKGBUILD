# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pyname=traitlets
pkgname=python-$_pyname
pkgver=5.11.1
pkgrel=1
pkgdesc='A configuration system for Python applications'
arch=(any)
url='https://traitlets.readthedocs.io/en/stable'
license=(BSD)
depends=(python
         python-argcomplete)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest-mock)
source=(https://pypi.python.org/packages/source/t/traitlets/traitlets-$pkgver.tar.gz)
sha256sums=('813584bb569ac4a098c64ca494e8a3bbfef42e37c36a6132bca554aabd111480')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
