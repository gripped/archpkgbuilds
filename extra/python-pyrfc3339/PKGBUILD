# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-pyrfc3339
pkgver=2.0.1
pkgrel=1
pkgdesc="Parses and generates RFC 3339-compliant timestamps using Python datetime.datetime objects."
arch=('any')
license=('MIT')
url="https://pypi.python.org/pypi/pyRFC3339"
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/kurtraschke/pyRFC3339.git#tag=v$pkgver"
        4fa081a3.patch)
sha512sums=('33ac2985c11527162d63cbb1adf82a8b7b6f3121e21c07262d094741676ae3bf4df7097603044a215307d70b2171ea37f9508e0c4f822cc4114bcf8d536f972d'
            '10b5e4661509f14452146470c536cae20ba9b183da1883581c6ef6c8d65e86df2cecf593c6b8841bc927294cb501a6231e4ef6ca769c944e98d01be577d04bd6')

prepare() {
  cd pyRFC3339
  patch -p1 -i ../4fa081a3.patch # Fix tests with Python 3.14
}

build() {
  cd pyRFC3339
  python -m build --wheel --no-isolation
}

check() {
  cd pyRFC3339
  pytest --doctest-modules
}

package() {
  cd pyRFC3339
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
