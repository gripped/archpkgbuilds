# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-pymdown-extensions
pkgver=10.19
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
sha256sums=('e8051f309565e5d7abd09c5f5a1cd015eb8abcffe0538faa8ed8a957ba3ba508')

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
