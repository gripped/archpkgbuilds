# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-gherkin
_pkgname=${pkgname#python-}
pkgver=34.0.0
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
  'python-uv-build'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d846a7916974a4a390ee1cd32b2b52a571b32731be1fa780197064b2333c62b3')

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
