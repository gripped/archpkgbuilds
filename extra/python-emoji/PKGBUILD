# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-emoji
pkgver=2.13.2
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/carpedm20/emoji.git#tag=v$pkgver")
sha512sums=('8ef6578d0257d29992fc159e2cb5ac65b5dc10f9314b2bfae45cf64fa641c46a0803cb2b10f6c92b5f59199e510b27119e1fdf62e40c192a71f5dab333cc80ca')

build() {
  cd emoji
  python -m build -nw
}

check() {
  cd emoji
  pytest
}

package() {
  cd emoji
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
