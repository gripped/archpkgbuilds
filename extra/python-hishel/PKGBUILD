# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-hishel
_name="${pkgname#python-}"
pkgver=1.3.1
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
sha512sums=('c778256359d0978fdcd106e73d43a2075c68bae711c4fa62f0e025693621d1eeec67c828bc95213e1ffa1a8fe6708aadd6fa3bbfa8fd8eed9ea319d1b580d7c3')
b2sums=('e6431600903281c6d7984b89ff3b48623310d15e0fb95f2f52cbf8b5d87e464371162754a80730c2565aa7a33a045515baaeac669aed2bd773da5ecfd0bb7f09')

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
