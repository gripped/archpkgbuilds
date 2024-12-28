# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=starlette
pkgname=python-$_name
pkgver=0.44.0
pkgrel=1
pkgdesc='The little ASGI framework that shines'
arch=(any)
url="https://github.com/encode/starlette"
license=(BSD-3-Clause)
depends=(
  python
  python-anyio
)
makedepends=(
  python-build
  python-installer
  python-hatchling
  python-wheel
)
checkdepends=(
  python-aiosqlite
  python-databases
  python-pytest
  python-trio

  # optdepends
  python-itsdangerous
  python-jinja
  python-python-multipart
  python-pyyaml
  python-httpx

  # not specified,but required
  python-sqlalchemy
)
optdepends=(
  'python-itsdangerous: for session middleware support'
  'python-jinja: for jinja templates'
  'python-python-multipart: for form parsing'
  'python-pyyaml: for schema generator'
  'python-httpx: for test client'
)
source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('052baac1a0f60354a35711e87de58b90b1c6fd13f6a2290746663dcc88d131840c340a2c95f8664b4b6347a7397639e26e547a1c353ca7b1911c3f5e3873868e')
b2sums=('f566f354b87379ba076b37ebb7366ffc8c209bf1318f8c49ffcdc2cb604b90d29ecb24071b17c551c7e2aa4d383393fae9bf2b3e8129095e7adcaf10956d3a9d')

prepare() {
  cd $_name-$pkgver
  # Ignore new warnings from python-anyio 4.4.0 making check() fails
  sed -i '/"error"/d' pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --deselect 'tests/test_routing.py::test_lifespan_with_on_events[asyncio]'
    --deselect 'tests/test_routing.py::test_lifespan_with_on_events[trio]'
  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
