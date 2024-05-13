# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-plette
pkgver=2.0.0
pkgrel=1
pkgdesc="Structured Pipfile and Pipfile.lock models"
url="https://github.com/sarugaku/plette"
license=('ISC')
arch=('any')
depends=('python-tomlkit')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-cerberus')
source=("git+https://github.com/sarugaku/plette.git#tag=v$pkgver")
sha512sums=('928c93f9d3838734e2983859c6cb00d2935ffa60cc28cc9a1e5bdfa77b70adfd69965465939ed85e4ab8c9f3805004d01409818d1fa6e1cf596a0b2217bc9d1e')

build() {
  cd plette
  python -m build -nw
}

check() {
  cd plette
  python -m venv .venv --system-site-packages
  .venv/bin/python -m installer dist/*.whl
  .venv/bin/python -m pytest
}

package() {
  cd plette
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
