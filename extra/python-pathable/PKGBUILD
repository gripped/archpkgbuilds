# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pathable
pkgver=0.4.4
pkgrel=1
pkgdesc="Object-oriented paths"
url="https://github.com/p1c2u/pathable"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("git+https://github.com/p1c2u/pathable.git#tag=$pkgver")
sha512sums=('1815b840c9029438d3962db8bf8fa63ade065b9d50586d9fdcad56cf435e4c5a06eaa9bd19f0c229d95ed53865b038f6bb70b4db4397191de65cdf2c7caee5ee')

prepare() {
  cd pathable
  sed -i '/--cov/d' pyproject.toml
}

build() {
  cd pathable
  python -m build -wn
}

check() {
  cd pathable
  pytest
}

package() {
  cd pathable
  python -m installer -d "$pkgdir" dist/*.whl
}
