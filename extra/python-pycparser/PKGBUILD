# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=python-pycparser
pkgver=3.11
pkgrel=1
pkgdesc='C parser and AST generator written in Python'
url='https://github.com/eliben/pycparser'
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
arch=('any')
license=('BSD-3-Clause')
source=("git+https://github.com/eliben/pycparser.git#tag=release_v$pkgver")
sha512sums=('12b60047d912c427c5207b8ab75cf56f772b5c235989d2ac938067db4b5eea4b10677243172a3beedc90b07d70074be49ef10c4d559406702bbcb2bd85474345')

build() {
  cd pycparser
  python -m build --wheel --no-isolation
}

check() {
  cd pycparser
  python -m unittest discover
}

package() {
  cd pycparser

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
