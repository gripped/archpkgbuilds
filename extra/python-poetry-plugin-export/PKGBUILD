# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=poetry-plugin-export
pkgname=python-poetry-plugin-export
pkgver=1.6.0
pkgrel=1
pkgdesc="Poetry plugin to export the dependencies to various formats "
url="https://github.com/python-poetry/poetry-plugin-export"
license=('MIT')
arch=('any')
depends=('python-poetry')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-mock' 'python-pytest-xdist')
source=("https://github.com/python-poetry/poetry-plugin-export/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9ea155a2f80b63c0ed7261615041048f0afdacbb21a6c0618cf4174cc76b2c10ac3102eb7325fda760d6cfac0e95b9194b2f16c33395c88dffcea9ddfaf0ac65')

build() {
  cd poetry-plugin-export-$pkgver
  python -m build -wn
}

check() {
  cd poetry-plugin-export-$pkgver
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd poetry-plugin-export-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
