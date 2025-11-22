# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-pymdown-extensions
pkgver=10.17.1
pkgrel=1
pkgdesc="Extensions for Python Markdown"
arch=(any)
url="https://github.com/facelessuser/pymdown-extensions"
license=(MIT)
depends=(
  python
  python-markdown
  python-yaml
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-pytest
  python-pygments
)
optdepends=('python-pygments: for code highlighting')
provides=(pymdown-extensions)
replaces=(pymdown-extensions)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b28e4f3110b3adcc56aeac6d41f616d56d21e88dfb1569fbb94f58f80c8463ee')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  pytest
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
