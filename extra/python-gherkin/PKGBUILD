# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-gherkin
_pkgname=${pkgname#python-}
pkgver=30.0.4
pkgrel=2
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
sha256sums=('4a3e87b4aa408ae20ba44e97f6e815ce8576dc43ee544d8dc878399b4f07cedd')

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
