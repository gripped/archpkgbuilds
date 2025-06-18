# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-phonenumbers
pkgver=9.0.6
pkgrel=1
pkgdesc="Python version of Google's common library for parsing, formatting, storing and validating international phone numbers"
arch=('any')
url="https://github.com/daviddrysdale/python-phonenumbers"
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-protobuf')
source=("git+https://github.com/daviddrysdale/python-phonenumbers.git#tag=v$pkgver")
sha512sums=('faf4a53121f97c2e46a771252251ea1106d3636097c0769c296026245fcb7538c74e7067ca21df71872a070a05464e55b005b418c01f849af56c921f3495e4f7')

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
