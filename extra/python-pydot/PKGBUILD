# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contrinutor: shining <shiningxc@gmail.com>
# Contributor: phillid <dbphillipsnz _at_thingy_that_swirly_a_symbol gmaildott comm>

pkgname=python-pydot
pkgver=4.0.0
pkgrel=1
pkgdesc="Python interface to Graphviz's Dot"
arch=('any')
url="https://github.com/pydot/pydot"
license=('MIT')
depends=('python-pyparsing' 'graphviz')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-chardet' 'python-parameterized' 'python-pytest')
source=("git+https://github.com/pydot/pydot#tag=v$pkgver")
sha512sums=('124ee088668d174150befc98ea0a95a261cc77154cc0d0387bf99e4b3d8d920689a237540b490ec72760c78186dd3366c3f6ab2bd2cd0f0690fb5473847b4b29')

build() {
  cd pydot
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd pydot
  python -m venv --system-site-packages testenv
  testenv/bin/python -m installer dist/*.whl
  testenv/bin/python -m pytest
}

package() {
  cd pydot
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSES/MIT.txt
}
