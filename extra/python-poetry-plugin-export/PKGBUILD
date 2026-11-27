# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=poetry-plugin-export
pkgname=python-poetry-plugin-export
pkgver=1.10.2
pkgrel=1
pkgdesc="Poetry plugin to export the dependencies to various formats "
url="https://github.com/python-poetry/poetry-plugin-export"
license=('MIT')
arch=('any')
depends=('python-poetry')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-mock' 'python-pytest-xdist')
source=("git+https://github.com/python-poetry/poetry-plugin-export.git#tag=$pkgver")
sha512sums=('c4be95e55318520b3b1ba3b6335932aa29ee42cf331994eec004ddaffbfa1a7ebb6722bd195809ef56273b1f3019e4b5d08d8c1af402dd05379677ae3c0de8db')

prepare() {
  cd poetry-plugin-export
}

build() {
  cd poetry-plugin-export
  python -m build -wn
}

check() {
  cd poetry-plugin-export
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd poetry-plugin-export
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
