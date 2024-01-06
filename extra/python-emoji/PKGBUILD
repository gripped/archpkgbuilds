# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-emoji
pkgver=2.7.0
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/e/emoji/emoji-$pkgver.tar.gz")
sha512sums=('690b5a2e9ee434c76fc6a0bb63808f6d4eea6392c314003508ac9fc5f1a56cc8daaeaa5a8db3897c8a85c968696d2b65c54b3fc99fc5f3949aca8b63cba11454')

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
