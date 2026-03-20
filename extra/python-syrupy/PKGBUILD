# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=4.6.3
pkgrel=1
pkgdesc="Pytest Snapshot Test Utility"
arch=('any')
license=('Apache-2.0')
url="https://github.com/tophat/syrupy"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
source=("git+https://github.com/tophat/syrupy.git#tag=v$pkgver")
sha512sums=('4eeb9f30dd6d9f724f05f14030249eac3684aa0a50f6fc9709f4184a86c7541a79dcc09afda63c9dc92b292d199e0eb003b608dbd099b3bc4865eb7e51831081')

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
