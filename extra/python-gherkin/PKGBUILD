# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-gherkin
_pkgname=${pkgname#python-}
pkgver=32.1.1
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
sha256sums=('97606879d7e2a5acd4a637b514d39717a49292c8b0a2cc61a6eec790cbf0a60c')

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
