# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-parse-type
pkgver=0.6.1
pkgrel=1
pkgdesc="Simplifies to build parse types based on the parse module"
url="https://github.com/jenisys/parse_type"
license=('MIT')
arch=('any')
depends=('python-parse' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-html')
source=("https://github.com/jenisys/parse_type/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6e4efae3ae1bba2b6aadd37e15f366b3146007c1d19874c07cf85ff4d3e4c439febf304fc5f19344e2a036b2605b0ce67fccfe22277ecbdc700cb61049b60dc1')

build() {
  cd parse_type-$pkgver
  python -m build -nw
}

check() {
  cd parse_type-$pkgver
  pytest
}

package() {
  cd parse_type-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
