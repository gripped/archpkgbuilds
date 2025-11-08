# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-gherkin
pkgver=36.1.0
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
sha256sums=('110869a0b89bf559476d084d287a460892752729a6ab9e6fd8648d8095694de7')

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
