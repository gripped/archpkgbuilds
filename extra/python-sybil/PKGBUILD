# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sybil
pkgver=8.0.1
pkgrel=1
pkgdesc='Automated testing for the examples in your documentation.'
arch=('any')
license=('MIT')
url='https://github.com/simplistix/sybil'
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-seedir' 'python-testfixtures' 'python-yaml')
source=("git+https://github.com/simplistix/sybil.git#tag=$pkgver")
sha512sums=('872cc3732fddb6de5ed5146a7295038faebed8685b4dfcd846f967fa5c1d833807a06b0e1373d9d983a0b741b91c840615cb9b9b0183aeab9af1eb18c5f8d84b')

build() {
  cd sybil
  python -m build --wheel --no-isolation
}

check() {
  cd sybil
  python -m pytest
}

package() {
  cd sybil
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
