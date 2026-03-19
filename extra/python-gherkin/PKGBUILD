# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-gherkin
pkgver=39.0.0
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
b2sums=('209acde06c105b64850812d06045aff6f458800cfe67a9a403ab6698c85f3fa0f66e78942348249aed3f037f065b754d56502832b59f7d61f97c54c144995423')

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
