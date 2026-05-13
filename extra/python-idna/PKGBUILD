# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-idna
pkgver=3.15
pkgrel=1
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest')
source=("git+https://github.com/kjd/idna.git#tag=v$pkgver")
sha512sums=('5c67bcfba5ed6417ee290848142c4e1a601b22a4d860bba73ac25c28b4aad73bc14ec9b0efccb3315795ff702cbea48a420c44a9fc22a9f9705ac00623747bb7')

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
