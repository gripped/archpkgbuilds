# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-phonenumbers
pkgver=9.0.10
pkgrel=1
pkgdesc="Python version of Google's common library for parsing, formatting, storing and validating international phone numbers"
arch=('any')
url="https://github.com/daviddrysdale/python-phonenumbers"
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-protobuf')
source=("git+https://github.com/daviddrysdale/python-phonenumbers.git#tag=r$pkgver")
sha512sums=('0b116d939bf4fae8836bec1a7f272941787fc5778fc456cff79e4b1902724dec39c99822f28ed103a5c8199a744f173a06fbcd0a2748e5a0169a601e389cdeff')

build() {
  # Regenerate the protobuf files
  rm python-phonenumbers/python/phonenumbers/pb2/phonenumber_pb2.py
  cd python-phonenumbers/tools/python
  make pb2

  cd ../../python
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
