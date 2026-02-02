# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-hishel
_name="${pkgname#python-}"
pkgver=1.1.8
pkgrel=1
pkgdesc="An elegant HTTP Cache implementation for HTTPX and HTTP Core"
arch=(any)
url="https://github.com/karpetrosyan/hishel"
license=(BSD-3-Clause)
depends=(
  python
  python-anyio
  python-anysqlite
  python-httpcore  # pulled in by python-httpx
  python-httpx
  python-msgpack
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
  python-inline-snapshot
  python-pytest
  python-pyyaml
  python-redis
  python-requests
  python-time-machine
  python-trio
)
optdepends=(
  'python-boto3: for S3 support'
  'python-fastapi: for FastAPI support'
  'python-pyyaml: for YAML support'
  'python-redis: for Redis support'
  'python-requests: for requests support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('c36f11bf3cdaf69197ce8daa84f022c73c41fb07c8d63c18abba40aecf31b22038a2226b48b93179161aab8c898dad475a5dcdba253cfd7b43ee1b56b618604a')
b2sums=('835d31935cb55ea3f0aa5a665302be78a673142ec2d5b4151a420d30bcaaa4efc419f4307ca6641d8541707bb401810bf120d0994b7e8b242faa3ff39b11f95d')

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
