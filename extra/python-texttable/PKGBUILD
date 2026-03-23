# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: rich_o <rich_o@lavabit.com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Daniel YC Lin <dlin.tw at gmail>

pkgname=python-texttable
pkgver=1.7.0
pkgrel=5
pkgdesc="Generate a formatted text table using ASCII characters"
arch=('any')
url="https://pypi.python.org/pypi/texttable/"
license=('MIT')
depends=('python')
optdepends=('python-cjkwrap: for better CJK support')
makedepends=('git' 'python-build' 'python-cjkwrap' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/foutaise/texttable.git#tag=v$pkgver")
sha512sums=('5b39841dc7ecdcaa1c50f39519e3e7a55c2bbf95463b7093c59a66f1891fddf147160426fcda08d6638bd243e1136caef47b9e7072abf427b57d127dab782e75')

build() {
  cd texttable
  python -m build --wheel --no-isolation
}

check() {
  cd texttable
  pytest tests.py
}

package() {
  cd texttable
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
