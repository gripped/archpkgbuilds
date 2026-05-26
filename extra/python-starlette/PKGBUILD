# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=starlette
pkgname=python-$_name
pkgver=1.1.0
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
sha512sums=('a351b971ee4ed3d2c305c3811e1fd0649f7039d4a72ed70ddbd3054a68ca3ccb89dea444647b31abf15057db7c03fa05fd92a488871febdd2b9bf7c421aad72f')
b2sums=('be2256692c7cd286e6b414504aa71d10187b1bd245c73030b57f1919aaadaaf665bb5253eae4adfd1183ea6ac9282670a6f3a98d09bedf4412f48804ca99e6cd')

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
