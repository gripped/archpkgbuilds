# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-idna
pkgver=3.13
pkgrel=1
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest')
source=("git+https://github.com/kjd/idna.git#tag=v$pkgver")
sha512sums=('3ff4acd8689f959072a325535eea5185e82ccd0233dd536b393160d8a06af886a72a537aac472e434db2599d31cd690cfa7ea200381311b9f21f133cf3659680')

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
