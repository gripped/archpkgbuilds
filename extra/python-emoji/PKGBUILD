# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-emoji
pkgver=2.8.0
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/e/emoji/emoji-$pkgver.tar.gz")
sha512sums=('e53fdf5f086260b34239b85dec8642c9f2cad042432a498636c7abc696712fadc69f0bb43b0f48321edbce761f62f5ffa38d171308e9bec0e5a27d5885322578')

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
