# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-hishel
_name="${pkgname#python-}"
pkgver=0.0.25
pkgrel=1
pkgdesc="An elegant HTTP Cache implementation for HTTPX and HTTP Core"
arch=(any)
url="https://github.com/karpetrosyan/hishel"
license=(BSD-3-Clause)
depends=(
  python
  python-anyio  # pulled in by python-httpx
  python-httpcore  # pulled in by python-httpx
  python-httpx
  python-typing_extensions
)
makedepends=(
  python-build
  python-hatchling
  python-hatch-fancy-pypi-readme
  python-installer
)
checkdepends=(
  python-anyio
  python-anysqlite
  python-moto
  python-pytest
  python-redis
  python-trio
)
optdepends=(
  'python-boto3: for S3 support'
  'python-pyyaml: for YAML support'
  'python-redis: for Redis support'
  'python-anysqlite: for SQLite support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('16aec1ea495075b4932e1e9d16b07af060b49bb74faed097343bde99c5d2b656b36762b2f2d67fd46c31b700206eec77ecdfb364a1c2cd19bb67c3055abc9e98')
b2sums=('dd7d7bec47700a1ab07976ba31b951adacf7e917dd7ba09419cc6e3b81f1b6609a1f7f14a6c176b0c151ed255cf099f3da60122717b2be9161bd41b7ba080f36')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vvv
    # we don't care about testing redis
    --deselect 'tests/_async/test_storages.py::test_redisstorage[asyncio]'
    --deselect 'tests/_async/test_storages.py::test_redisstorage_expired[asyncio]'
    --deselect 'tests/_sync/test_storages.py::test_redisstorage[asyncio]'
    --deselect 'tests/_sync/test_storages.py::test_redisstorage[trio]'
    --deselect 'tests/_sync/test_storages.py::test_redisstorage_expired[trio]'
    --deselect 'tests/_sync/test_storages.py::test_redisstorage_expired[asyncio]'
  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
