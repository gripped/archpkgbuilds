# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Avery Warddhana <them+arch _ nullablevo id au>

_pyname=overrides
pkgname=python-$_pyname
pkgver=7.5.0
pkgrel=1
pkgdesc='A decorator to automatically detect mismatch when overriding a method'
url='https://github.com/mkorpela/overrides'
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('429d45886dd824402e6a6ad085f85b59e28f1cd9df54c722fd94ec790f6608ca')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
