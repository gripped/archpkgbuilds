# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-geoip2
pkgver=5.1.0
pkgrel=2
pkgdesc="MaxMind GeoIP2 API"
url="https://github.com/maxmind/GeoIP2-python"
license=('Apache')
arch=('any')
depends=(
  python
  python-aiohttp
  python-maxminddb
  python-requests
  python-setuptools
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-httpserver
)
source=(
  git+https://github.com/maxmind/GeoIP2-python.git#tag=v$pkgver
  git+https://github.com/maxmind/MaxMind-DB.git
)
sha512sums=('7148ae01ab01920a39ba0b167955ad93f756cd52d8da243b38006f06b0661a176bbe7aee41af5dceaf37ac19c7b65bf1bde14f6a04c74ff5a84c096e7a31134b'
            'SKIP')

prepare() {
  cd GeoIP2-python
  git submodule init
  git config submodule.tests/data.url "$srcdir/MaxMind-DB"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd GeoIP2-python
  python -m build --wheel --no-isolation
}

check() {
  cd GeoIP2-python
  pytest -vv
}

package() {
  cd GeoIP2-python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
