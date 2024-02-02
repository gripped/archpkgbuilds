# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-emoji
pkgver=2.10.1
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/e/emoji/emoji-$pkgver.tar.gz")
sha512sums=('782df7ad3ecb1c599313c9ebc2bddcb33d1160eda73fc5cd3abe6daac82a546cd4828a68248711cbfae7158af2329bbfa264175e81919eed6f4e44b8e3dbc9ae')

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
