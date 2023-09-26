# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pyname=traitlets
pkgname=python-$_pyname
pkgver=5.10.1
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
sha256sums=('db9c4aa58139c3ba850101913915c042bdba86f7c8a0dda1c6f7f92c5da8e542')

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
