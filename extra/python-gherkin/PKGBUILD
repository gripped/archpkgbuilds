# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-gherkin
_pkgname=${pkgname#python-}
pkgver=32.1.2
pkgrel=1
pkgdesc="A parser and compiler for the Gherkin language"
arch=('any')
url="https://github.com/cucumber/gherkin"
license=('MIT')
depends=(
  'python'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1b92adad1fb61347e4360b8d2573ded2dc8abb1a197814403a3ad6656d70d887')

build() {
  cd "$_pkgname-$pkgver/python"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver/python"
  pytest
}

package() {
  cd "$_pkgname-$pkgver/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
