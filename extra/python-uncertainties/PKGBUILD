# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-uncertainties
pkgver=3.2.3
pkgrel=3
pkgdesc="Transparent calculations with uncertainties on the quantities involved (aka error propagation); fast calculation of derivatives."
arch=('any')
license=('BSD')
url="https://github.com/lmfit/uncertainties"
depends=('python')
optdepends=('python-numpy: additional support for NumPy arrays and matrices')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-numpy')
source=("git+https://github.com/lmfit/uncertainties.git#tag=$pkgver")
sha512sums=('85588db20a9a9954bcbc883a39551565821d59c51edee0c41359f9432e9006e5815f53f1d0dbd1576bdfeef7dfb7b80a384c6503cc9ac6daf0c9ae26a5a72a8f')

prepare() {
  cd uncertainties
  git cherry-pick -n 633da70494ae6570cc69a910e1f6231538acf374 # Fix test with python 3.14
}

build() {
  cd uncertainties
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build -nw
}

check() {
  cd uncertainties
  python -m pytest
}

package() {
  cd uncertainties
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
