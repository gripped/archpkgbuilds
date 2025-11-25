# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-gherkin
pkgver=37.0.0
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
sha256sums=('a8f75223396d2827ae79f3d427c1fd5df10db89bfaa5100cabea7e3777ccc2ab')

build() {
  cd "${pkgname#python-}-$pkgver/python"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname#python-}-$pkgver/python"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "${pkgname#python-}-$pkgver/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
