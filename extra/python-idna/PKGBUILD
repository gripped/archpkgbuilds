# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-idna
pkgver=3.16
pkgrel=1
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest')
source=("git+https://github.com/kjd/idna.git#tag=v$pkgver")
sha512sums=('e31c95859e16d0ac3c657f06d5efbc260e0b02fc15e8e33aed4fc71e043ca0e7b9e73dd1ecfd49aed5b47c889147676a09110cfe610e71dd54a28601c8bea9b4')

build() {
   cd idna
   python -m build --no-isolation --wheel
}

check() {
   cd idna
   pytest
}

package() {
   cd idna
   python -m installer --destdir="$pkgdir" dist/*.whl
   install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
