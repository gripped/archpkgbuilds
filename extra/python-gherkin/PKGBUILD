# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-gherkin
pkgver=38.0.0
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
b2sums=('48951a0ef8f3aab3cfee7e83a9cb9a494a220f79ee53ce4b194b06d2ff85efeb94479187bbe5bdd25aab2d10a681d1c9ec78533a1ac880c01549320e80268cf9')

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
