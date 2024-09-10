# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-elastic-transport
_pkgname=elastic-transport-python
pkgver=8.15.0
pkgrel=2
pkgdesc="Transport classes and utilities shared among Python Elastic client libraries"
arch=(any)
url="https://github.com/elastic/elastic-transport-python"
license=(Apache-2.0)
depends=(
  python
  python-aiohttp
  python-certifi
  python-httpx
  python-orjson
  python-requests
  python-urllib3
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-pytest-httpserver
  python-pytest-rerunfailures
  python-respx
  python-trustme
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('55ae88fe51aa9698b71dcfa9d00ca2653d7b0c3f6e2bb160a8db0738499cf676')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  # The calls to httpbin.org, and as such the tests, are flaky when running on
  # build.archlinux.org.
  # OpenTelemetry not in Arch repos (yet).
  pytest --override-ini="addopts=" \
    --reruns 1 \
    --reruns-delay 1 \
    --ignore tests/test_otel.py
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
