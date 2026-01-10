# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=async-lru
pkgname=python-$_pyname
pkgver=2.0.5
pkgrel=2
pkgdesc='Simple LRU cache for asyncio'
arch=(any)
url='https://github.com/aio-libs/async-lru'
license=(MIT)
depends=(python)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
checkdepends=(python-pytest-asyncio
              python-pytest-cov
              python-pytest-timeout)
source=(git+https://github.com/aio-libs/async-lru#tag=v$pkgver)
sha256sums=('b4dfdbab0e308ed940f5ad0ebff184f9e2beb0fa1c8fce35c6d71b39fafa7d9d')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v -W ignore::DeprecationWarning
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
