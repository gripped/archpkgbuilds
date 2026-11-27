# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-geoip2
pkgver=5.4.0
pkgrel=1
pkgdesc="MaxMind GeoIP2 API"
url="https://github.com/maxmind/GeoIP2-python"
license=('Apache-2.0')
arch=('any')
depends=(
  python
  python-aiohttp
  python-maxminddb
  python-requests
)
makedepends=(
  git
  python-build
  python-installer
  python-uv-build
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
sha512sums=('f4a794383f9110d796b2d3db45756823aa907290b173d57a0aa2b8b83910fd315105ed50624d751ef4ad188446a827fc1ad0fc9e2e52247e1863f94a39fd4f70'
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

  python -m installer -d test_dir dist/*.whl

  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest \
    --deselect tests/webservice_test.py::TestAsyncClient
}

package() {
  cd GeoIP2-python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
