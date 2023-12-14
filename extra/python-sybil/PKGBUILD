# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sybil
pkgver=6.0.1
_commit=932e39d8644dc7db35eabf7acc0d1614edb870cd
pkgrel=1
pkgdesc='Automated testing for the examples in your documentation.'
arch=('any')
license=('MIT')
url='https://github.com/cjw296/sybil'
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-seedir' 'python-testfixtures' 'python-yaml')
source=("git+https://github.com/cjw296/sybil.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd sybil
  python setup.py build
}

check() {
  cd sybil
  python -m pytest
}

package() {
  cd sybil
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
