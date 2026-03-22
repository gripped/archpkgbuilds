# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sybil
pkgver=6.1.1
pkgrel=2
pkgdesc='Automated testing for the examples in your documentation.'
arch=('any')
license=('MIT')
url='https://github.com/simplistix/sybil'
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-seedir' 'python-testfixtures' 'python-yaml')
source=("git+https://github.com/simplistix/sybil.git#tag=$pkgver")
sha512sums=('aa02678e82402bbc0fdac8e931deeaeb4d81baa6165131e1779561634b0af59a9dd1884394134e257533b5351db3d39bb17a866e497d6a2302cda5078360a948')

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
