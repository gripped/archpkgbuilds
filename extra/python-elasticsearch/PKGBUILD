# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-elasticsearch
_pkgname=elasticsearch-py
pkgver=8.13.2
pkgrel=1
arch=(any)
pkgdesc="Official Python client for Elasticsearch"
url="https://github.com/elastic/elasticsearch-py"
license=(Apache-2.0)
depends=(
  python
  python-elastic-transport
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-aiohttp
  python-dateutil
  python-numpy
  python-orjson
  python-pandas
  python-pytest
  python-pytest-asyncio
  python-requests
  # Not available in Arch repos (yet)
  # python-simsimd
  python-yaml
)
optdepends=(
  'python-aiohttp: support for asynchronous requests'
  'python-numpy: support for Maximal Marginal Relevance (MMR) for search results'
  'python-orjson: support for faster JSON serialization'
  'python-requests: support for synchronous requests'
  # 'python-simsimd: support for Maximal Marginal Relevance (MMR) for search results'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e8086b7f335c75eb5ca3200948095b95ae4d1eb2e9973c84219b72904cfd17f4')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest --override-ini="addopts="
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
