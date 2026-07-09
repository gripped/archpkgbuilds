# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-hishel
_name="${pkgname#python-}"
pkgver=1.3.0
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
  python-fakeredis
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
sha512sums=('bf7ba8be77a73030f2f5395a3ffc46054ced3a0269b5d1bab8ff08d2d1c6561482984990946c48c58e6741281bc621f0b0a121c96fb3e9307f1858a089fe31c1')
b2sums=('b72932d00c848d135dc0607a1ea916ab6390faa7f75135a5e1f0bbc39a3f957ad87d04db27869abd86e21b12350225afe00c2d672f921b1367fb8dc5148d5bd5')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vvv
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
