# Maintainer:

_pyname=pytest-mypy-testing
pkgname=python-$_pyname
pkgver=0.1.2
pkgrel=1
pkgdesc='Plugin to test mypy output with pytest'
arch=(any)
license=(Apache
         MIT)
url='https://github.com/davidfritzsche/pytest-mypy-testing'
depends=(mypy
         python
         python-pytest)
makedepends=(python-build
             python-flit-core
             python-installer)
checkdepends=(python-pytest)
source=(https://github.com/davidfritzsche/pytest-mypy-testing/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('368606c83271423fde44bba52e559f5cc2374fd2364bf63baf6898d84ca41d39')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
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
  install -Dm644 LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname
}
