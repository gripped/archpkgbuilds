# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ijson
pkgver=3.4.0
pkgrel=2
pkgdesc="Iterative JSON parser with Pythonic interface"
arch=(x86_64)
url="https://github.com/ICRAR/ijson"
license=('BSD')
depends=('python' 'yajl')
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ICRAR/ijson/archive/v${pkgver}.tar.gz")
sha256sums=('151ac5a87e7e2c6b0306d5a15d85578065e9fad6c6d87678abd9648f58922300')

build() {
  cd ijson-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ijson-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest
}

package(){
  cd ijson-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}

# vim:ts=2:sw=2:et:
