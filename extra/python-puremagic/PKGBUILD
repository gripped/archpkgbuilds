# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-puremagic
pkgver=1.26
pkgrel=1
pkgdesc="A Python module that will identify a file based off it's magic numbers"
arch=('any')
url='https://github.com/cdgriffith/puremagic'
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('c23eaeb3bdd79e509bbe34268982c01883899eb9a510068aa4bbb0f08537af289d28960f903b19e1fcb996fa156ca89db054213a5c0137dd23491b1d3b158a49')
b2sums=('5b923b87c18ea3944e5cb0009fc1d6526c5aa9ba03d77f5fc2af428ee6b2f192772806fd2d87a0558c8bbde26cc1caf8bbe53b808d7eabe5242caa847a940d46')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$PWD:$PYTHONPATH" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
