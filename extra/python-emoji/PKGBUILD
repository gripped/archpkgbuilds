# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-emoji
pkgver=2.13.0
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji"
license=('BSD')
arch=('any')
depends=('python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/carpedm20/emoji.git#tag=v$pkgver")
sha512sums=('564e473a61b00729af1770c4d719b721d23bdf25c3b9117dda1bda0c96593fe1409593584da00ad10fc5924a862954219d11f9cdcba66ed10e38f2f375bbef8a')

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
