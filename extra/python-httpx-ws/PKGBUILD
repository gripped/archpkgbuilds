# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=httpx-ws
pkgname=python-$_pyname
pkgver=0.8.2
pkgrel=2
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
sha256sums=('2de7923746cab61eb9a6535a5062e80381bbac26a898c1599667af47ce356523'
            '13ffebbb4c916529420221d6bcb7073967b692d1d8f8bdd6e4266dfdcee9f0a9')

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
