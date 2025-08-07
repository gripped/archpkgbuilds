# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-elementpath
pkgver=5.0.3
pkgrel=1
pkgdesc="XPath 1.0/2.0 parsers and selectors for ElementTree and lxml"
url="https://github.com/sissaschool/elementpath"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-lxml' 'python-pytest' 'python-xmlschema')
source=("git+https://github.com/sissaschool/elementpath.git#tag=v$pkgver")
sha512sums=('3e377997b7140beb0f4176e1994119f35f6cb06a376b072634893b02aa9a43296a4c19a07237dbb0add1ffdfd91add44b37f99d9ea59448297728874c9662163')

build() {
  cd elementpath
  python -m build -nw
}

check() {
  cd elementpath
  python -m pytest
}

package() {
  cd elementpath
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
