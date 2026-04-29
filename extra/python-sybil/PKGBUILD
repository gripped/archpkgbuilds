# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sybil
pkgver=10.0.1
pkgrel=1
pkgdesc='Automated testing for the examples in your documentation.'
arch=('any')
license=('MIT')
url='https://github.com/simplistix/sybil'
depends=('python')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-pytest' 'python-seedir' 'python-testfixtures' 'python-yaml')
source=("git+https://github.com/simplistix/sybil.git#tag=$pkgver")
sha512sums=('6c15f39a3eba4f318c3c59d282b19f1e3beddbdd478b5af3a9a76ea27f73b4a93ccdb2bebfd9c94eb66116c93898deba2be94aef2fa359b46bee0d87eef1c730')

build() {
  cd sybil
  python -m build --wheel --no-isolation
}

check() {
  cd sybil
  PYTHONPATH=src python -m pytest
}

package() {
  cd sybil
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
