# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-prettytable
pkgver=3.15.1
pkgrel=1
pkgdesc="A simple Python library for easily displaying tabular data"
url="https://github.com/jazzband/prettytable"
arch=('any')
license=('BSD')
depends=('python-wcwidth')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest-lazy-fixtures' 'python-coverage')
conflicts=('python-ptable')
source=("git+https://github.com/jazzband/prettytable.git#tag=$pkgver")
sha512sums=('99f644bae17beeec5e5b448f399a1c87ce316a4a00453e9b1e82dcb139a90cdc9dfbd3d94a7188261b9ed6be745b5009c93bf2863e42c011839b5151f39129f7')

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
