# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-emoji
pkgver=2.9.0
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/e/emoji/emoji-$pkgver.tar.gz")
sha512sums=('147ef78b53f5a1ff284140ecefc08c9b486af148f96374800e0be460448ffdc5ade6138326a198bc5e1131a9cac7b25e133697bb8f004244fc7701b1bb02c364')

build() {
  cd emoji-$pkgver
  python setup.py build
}

check() {
  cd emoji-$pkgver
  pytest
}

package() {
  cd emoji-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
