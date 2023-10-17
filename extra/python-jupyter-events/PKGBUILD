# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=jupyter_events
pkgname=python-jupyter-events
pkgver=0.8.0
pkgrel=1
pkgdesc='Configurable event system for Jupyter applications and extensions'
arch=(any)
url='https://jupyter.org/'
license=(BSD)
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
sha256sums=('fda08f0defce5e16930542ce60634ba48e010830d50073c3dfd235759cee77bf')

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
