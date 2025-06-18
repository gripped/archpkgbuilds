# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-elementpath
pkgver=5.0.1
pkgrel=1
pkgdesc="XPath 1.0/2.0 parsers and selectors for ElementTree and lxml"
url="https://github.com/sissaschool/elementpath"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-lxml' 'python-pytest' 'python-xmlschema')
source=("git+https://github.com/sissaschool/elementpath.git#tag=v$pkgver")
sha512sums=('d20eaca3ee002fea2b6e9ffc562644980bfa6336e5704d5f7db82314e7eaec213c291fdfa0a9bdcec183f07cdf0a1e1a62f84e01263a17b04b3015045eb0a6c0')

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
