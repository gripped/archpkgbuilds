# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-hishel
_name="${pkgname#python-}"
pkgver=2.0.0
pkgrel=1
pkgdesc="An elegant HTTP Cache implementation for HTTPX and HTTP Core"
arch=(any)
url="https://github.com/karpetrosyan/hishel"
license=(BSD-3-Clause)
depends=(
  python
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
  python-fastapi
  python-httpx
  python-httpx2
  python-inline-snapshot
  python-pytest
  python-redis
  python-requests
  python-time-machine
  python-trio
)
optdepends=(
  'python-anyio: for general async as well as httpx and httpx2 support'
  'python-anysqlite: for general async as well as httpx and httpx2 support'
  'python-boto3: for S3 support'
  'python-fastapi: for FastAPI support'
  'python-httpx: for HTTP support with httpx'
  'python-httpx2: for HTTP support with httpx2'
  'python-redis: for Redis support'
  'python-requests: for requests support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('b9022dddeb92fbd790bdb25fb6df45a184bed8231a9e0f01528f7d4c14e47f4d7015e41fc53d0ab91a9401e2bce563e94b87e62b225a92dc6bc27285c6a37641')
b2sums=('56876b5991e74083a73b864ffc288debea94f1e7a15e3a90e6bca5ca795f86f0c7dcbdffea0166f91df6a078a23b71cc321419e73daa50603bb066f09f57dc2f')

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
