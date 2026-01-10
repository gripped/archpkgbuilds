# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-asyncpg
pkgver=0.31.0
pkgrel=2
pkgdesc="A fast PostgreSQL Database Client Library for Python/asyncio"
arch=(x86_64)
url="https://github.com/MagicStack/asyncpg"
license=(Apache-2.0)
depends=(
  glibc
  python
)
makedepends=(
  cython
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  postgresql
  python-distro
  python-pytest
  python-uvloop
)
source=(
  "git+$url.git#tag=v$pkgver"
  "git+https://github.com/MagicStack/py-pgproto"
)
sha256sums=('964ee857c1656a4158faae028123d06c392903c73c544b5a5c765d7fa1c3c68a'
            'SKIP')

prepare() {
  cd ${pkgname#python-}
  git submodule init
  git config submodule.asyncpg/pgproto.url "$srcdir/py-pgproto"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Deselect test failing with:
  #   ValueError: Invalid IPv6 URL
  test-env/bin/python -Pm pytest \
    --deselect tests/test_connect.py::TestConnectParams::test_connect_params
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
