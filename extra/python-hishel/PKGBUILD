# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-hishel
_name="${pkgname#python-}"
pkgver=0.1.3
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
  python-pytest
  python-pyyaml
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
sha512sums=('5807cb1ddd819e3903f038b330cde7abb12101a46782c5117cc97b4cd53e752d8ed0e69ac9d0142fe1314b2ce56f1173aac23989f96e78596bbc3b6696a4f713')
b2sums=('296337921b1b7091b3fd8c4ec45203c7dc6138659d4affcd26a84cedf408cd39c835bf24acee5766deb59c4589d81fb4a9b7fc2f38ae5e328175f2a886617502')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vvv
    # we don't care about testing redis
    --deselect 'tests/_async/test_storages.py::test_redisstorage'
    --deselect 'tests/_async/test_storages.py::test_redisstorage_expired'
    --deselect 'tests/_async/test_storages.py::test_redis_ttl_after_hits'
    --deselect 'tests/_sync/test_storages.py::test_redisstorage'
    --deselect 'tests/_sync/test_storages.py::test_redisstorage_expired'
    --deselect 'tests/_sync/test_storages.py::test_redis_ttl_after_hits'
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
