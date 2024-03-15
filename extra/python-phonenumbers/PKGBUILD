# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-phonenumbers
pkgver=8.13.31
_commit=95d5229972a294f0f6c7dd022cbd14bc65101026
pkgrel=2
pkgdesc="Python version of Google's common library for parsing, formatting, storing and validating international phone numbers"
arch=('any')
url="https://github.com/daviddrysdale/python-phonenumbers"
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-protobuf')
source=("git+https://github.com/daviddrysdale/python-phonenumbers.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd python-phonenumbers/python
  python -m build --wheel --no-isolation
}

check() {
  cd python-phonenumbers/python
  python -m unittest -v
}

package() {
  cd python-phonenumbers/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
