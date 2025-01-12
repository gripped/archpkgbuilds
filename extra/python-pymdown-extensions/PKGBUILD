# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-pymdown-extensions
_pkgname=${pkgname#python-}
pkgver=10.14
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('cff9df29d6f970fb5c364e0f5a857a83c43d5f37a38fd8a4349a9a5afb077cbe')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  pytest
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
