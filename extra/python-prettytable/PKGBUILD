# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-prettytable
pkgver=3.19.0
pkgrel=1
pkgdesc="A simple Python library for easily displaying tabular data"
url="https://github.com/jazzband/prettytable"
arch=('any')
license=('BSD-3-Clause')
depends=('python-wcwidth')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest-lazy-fixtures' 'python-coverage')
conflicts=('python-ptable')
source=("git+https://github.com/jazzband/prettytable.git#tag=$pkgver")
sha512sums=('651be2c414baa492ef6782de63edbdc0099d0e1e49df982a5cb8fec233a24360ef53c9f4390e0e8480c8225a013cde241dfd19d6e026917742f2712303f59b1c')

build() {
  cd prettytable
  python -m build -nw
}

check() {
  cd prettytable
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd prettytable
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
