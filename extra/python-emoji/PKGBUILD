# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-emoji
pkgver=2.12.0
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji"
license=('BSD')
arch=('any')
depends=('python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/carpedm20/emoji.git#tag=v$pkgver")
sha512sums=('38f220f62b985485a5d9f080644351a62e97c4291f09be1ac10b0c451117789c9560686e70f19fabf3a28d99137421ea96d8b269e681b3f19e88c8da8630a419')

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
