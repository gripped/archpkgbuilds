# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-emoji
pkgver=2.4.0
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/e/emoji/emoji-$pkgver.tar.gz")
sha512sums=('af00b00c230b2bf2ac8eff6d4eba6882f94eddf5a80e9503041fb463aea91118cef5b7985ae1a9f2ca1f9abb4e79043c48e5a09b83a5e9c6a91c9f146c7e3680')

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
