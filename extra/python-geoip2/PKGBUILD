# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-geoip2
pkgver=4.8.1
_testdatacommit=1271107ccad72c320bc7dc8aefd767cba550101a
pkgrel=1
pkgdesc="MaxMind GeoIP2 API"
url="https://github.com/maxmind/GeoIP2-python"
license=('Apache')
arch=('any')
depends=(
  'python'
  'python-aiohttp'
  'python-maxminddb'
  'python-requests'
  'python-setuptools'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-httpserver'
)
source=(
  "https://github.com/maxmind/GeoIP2-python/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  MaxMind-DB-$_testdatacommit.tar.gz::https://github.com/maxmind/MaxMind-DB/archive/$_testdatacommit.tar.gz
)
sha512sums=('4c2c212702bd039b9e69de6b3479b35d817dd3defe6ec76ba52711bd6cd54c26a4a8cb8a7566545b0e90e156c769064dbbad9451d88c6cd3007f7b44728e1979'
            'a028b07cfdb84b98629e66937472feb291e0c022cf226513d765b21c420672620ff00b9004aa4cf1519d76a428a33600c453335e2fa9832e78e4621307b5723b')

prepare() {
  cd GeoIP2-python-$pkgver
  rmdir tests/data
  ln -s "$srcdir"/MaxMind-DB-$_testdatacommit tests/data
}

build() {
  cd GeoIP2-python-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )

  cd GeoIP2-python-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd GeoIP2-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
