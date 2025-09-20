# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=httpx-ws
pkgname=python-$_pyname
pkgver=0.8.0
pkgrel=1
pkgdesc='WebSocket support for HTTPX'
arch=(any)
url='https://frankie567.github.io/httpx-ws/'
license=(MIT)
depends=(python
         python-anyio
         python-httpcore
         python-httpx
         python-wsproto)
makedepends=(git
             python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest
              python-pytest-cov
              python-starlette
              python-trio
              uvicorn)
source=(git+https://github.com/frankie567/httpx-ws#tag=v$pkgver
        no-regex-commit.patch)
sha256sums=('39e48dc856c63d09348be22e3f0c37ada7cc303624554c0a17318b72521424c3'
            '015fb328b794b85aa45cefe3fc50e9e82f0263994e678d70055d96e6365fcfd4')

prepare() {
  cd $_pyname
  patch -p1 -i ../no-regex-commit.patch # Don't require python-hatch-regex-commit
}

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  pytest -v \
    --deselect tests/test_api.py::TestReceive::test_receive \
    --deselect tests/test_api.py::test_receive_close
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
