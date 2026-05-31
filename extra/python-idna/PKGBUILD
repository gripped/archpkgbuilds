# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-idna
pkgver=3.17
pkgrel=1
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest')
source=("git+https://github.com/kjd/idna.git#tag=v$pkgver")
sha512sums=('1730c1d85eeb0e8df5bafaba9c922af14302ecc47f1168f4ca8bfca44bba0e5f70a3c1796c9605d14c83436e1904566059cf3a9b6647a166a1a4ba62d4fd9ab2')

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
