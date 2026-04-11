# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=4.7.1
pkgrel=1
pkgdesc="Pytest Snapshot Test Utility"
arch=('any')
license=('Apache-2.0')
url="https://github.com/tophat/syrupy"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
source=("git+https://github.com/tophat/syrupy.git#tag=v$pkgver")
sha512sums=('eefa8db05406469e3ff2f1a7bcbe8bf7d83d43cd56959e38745e09ba29ddcbb7578fa44d04ffb0fe97fd1403b63bd692c1f6478350711c0086dc9ce49d667c2c')

build() {
  cd syrupy
  python -m build -nw
}

check() {
  cd syrupy
  python -m venv tmpenv --system-site-packages
  tmpenv/bin/python -m installer dist/*.whl
  tmpenv/bin/python -m pytest
}

package() {
  cd syrupy
  python -m installer -d "$pkgdir" dist/*.whl
}
