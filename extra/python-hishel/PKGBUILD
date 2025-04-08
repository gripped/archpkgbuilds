# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-hishel
_name="${pkgname#python-}"
pkgver=0.1.2
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
sha512sums=('11b5eed0d5bbae099306c7274c50d677ce831f42f35b17beb09ae5f71abb947969ebb8a7dd1e983ac6a067e6ca0e59648a7c8bb52eb7b0b61dc20573c940a7c2')
b2sums=('e301071b563071b0b3f33d7ab9913dd363732f6cd9a5e93f33ca3ea7cf86d14fb400ee10627dd9448df3ba3879c3dd0c490b3d435d2012d5176b42b3d6cdf92a')

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
