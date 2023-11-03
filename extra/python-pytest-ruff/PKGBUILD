# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-ruff
pkgver=0.2
_commit=df22c01741f8f44d19ad4f9bdfbef8f184318aff
pkgrel=1
pkgdesc="Pytest plugin to check ruff requirements"
url="https://github.com/businho/pytest-ruff"
license=('MIT')
arch=('any')
depends=('python' 'python-pytest' 'python-ruff')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core'
             'python-poetry-dynamic-versioning')
checkdepends=('python-pytest-mock')
source=("git+https://github.com/businho/pytest-ruff.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd pytest-ruff
  sed 's/--cov --cov-report term --cov-report xml//' -i pyproject.toml
}

build() {
  cd pytest-ruff
  python -m build -nw
}

check() {
  cd pytest-ruff
  python -m pytest
}

package() {
  cd pytest-ruff
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
