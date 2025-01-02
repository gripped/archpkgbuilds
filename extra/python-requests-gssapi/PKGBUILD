# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=python-requests-gssapi
pkgver=1.3.0
pkgrel=1
pkgdesc="GSSAPI (HTTP Negotiate) authentication for Python-Requests"
arch=(any)
url="https://github.com/pythongssapi/requests-gssapi"
license=(ISC)
depends=(
  python
  python-gssapi
  python-requests
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6f82e7c50c914691a635fe0e29df1d53db693296393af978c622ed1d5a280cae')

build() {
  cd "${pkgname#python-}-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname#python-}-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "${pkgname#python-}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
