# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-hishel
_name="${pkgname#python-}"
pkgver=1.2.1
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
sha512sums=('52571a8e4ec44e45fddc432491e6c8fcdada42cf7bf07b11c3f95f0e96414e271057bdd1ea8aa0a50a2087aa171792b932a3e24cacbd05f117e50769aaef59d7')
b2sums=('71057e49836c406b703fcba2e8a839cc401abb1a584466b3943044529fd9ac5591c239bc7a34c00b5919eb064d5cbc19efa36a66a91112b3bfc90dfa88a2ef2c')

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
