# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-geoip2
pkgver=5.0.1
pkgrel=1
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
sha512sums=('3069908b57c221ba5dcf650ee7b509efd7b6d416dd14911ba2c6ce1cc1570bd6efd9f91f9d3a625ba42a13941693668f9ea8445a6c8e57b2da789ff62f4404d7'
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
