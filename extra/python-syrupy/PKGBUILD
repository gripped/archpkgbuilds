# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=4.7.2
pkgrel=1
pkgdesc="Pytest Snapshot Test Utility"
arch=('any')
license=('Apache-2.0')
url="https://github.com/tophat/syrupy"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
source=("git+https://github.com/tophat/syrupy.git#tag=v$pkgver")
sha512sums=('9d2747d7d4a13d5fa6bb89b6fdf03eb5076a6a007a982745ae5de90c0027369fb361e870db4da915f195541b8812aaa3bb4e20efcfffd671c65a8cb9fdb6f7c3')

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
