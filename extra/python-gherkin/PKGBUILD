# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-gherkin
_pkgname=${pkgname#python-}
pkgver=33.0.0
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
sha256sums=('c9ac8ed3e7cb8dc1e93097841a338c4100b337c55a8ab3a6da95d5831095b9fc')

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
