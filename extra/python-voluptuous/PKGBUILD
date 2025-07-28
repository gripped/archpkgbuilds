# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-voluptuous
pkgver=0.15.1
pkgrel=1
pkgdesc="A Python data validation library"
url="https://github.com/alecthomas/voluptuous"
license=('BSD-3-Clause')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
source=(git+https://github.com/alecthomas/voluptuous.git#tag=$pkgver)
sha512sums=('85a9db9f2c9cfcf4092928dbca23aa731f3100dffd327b6339f7fdce0d62f5084594ae113a3efa771c30a9af9afc030973f76a976d72a8adb32082a2f0d9ba10')

build() {
  cd voluptuous
  python setup.py build
}

check() {
  cd voluptuous
  pytest
}

package() {
  cd voluptuous
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
