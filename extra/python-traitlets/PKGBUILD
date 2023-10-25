# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pyname=traitlets
pkgname=python-$_pyname
pkgver=5.12.0
pkgrel=1
pkgdesc='A configuration system for Python applications'
arch=(any)
url='https://traitlets.readthedocs.io/en/stable'
license=(BSD)
depends=(python
         python-argcomplete
         python-typing_extensions)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest-mock
              python-pytest-mypy-testing)
source=(https://pypi.python.org/packages/source/t/traitlets/traitlets-$pkgver.tar.gz)
sha256sums=('833273bf645d8ce31dcb613c56999e2e055b1ffe6d09168a164bcd91c36d5d35')

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
