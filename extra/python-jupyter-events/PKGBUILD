# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=jupyter_events
pkgname=python-jupyter-events
pkgver=0.9.1
pkgrel=1
pkgdesc='Configurable event system for Jupyter applications and extensions'
arch=(any)
url='https://jupyter.org/'
license=(BSD-3-Clause)
depends=(python
         python-click
         python-json-logger
         python-jsonschema
         python-referencing
         python-rich
         python-traitlets
         python-yaml)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest-asyncio
              python-pytest-console-scripts
              python-rfc3339-validator
              python-rfc3986-validator)
source=(https://github.com/jupyter/jupyter_events/releases/download/v$pkgver/$_pipname-$pkgver.tar.gz)
sha256sums=('a52e86f59eb317ee71ff2d7500c94b963b8a24f0b7a1517e2e653e24258e15c7')

build() {
  cd $_pipname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pipname-$pkgver
  python -m venv --system-site-packages test-env
  export PATH="$PWD/test-env/bin:$PATH"
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
  rm -fr test-env
}

package() {
  cd $_pipname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
