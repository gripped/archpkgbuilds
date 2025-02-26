# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-phonenumbers
pkgver=8.13.53
pkgrel=1
pkgdesc="Python version of Google's common library for parsing, formatting, storing and validating international phone numbers"
arch=('any')
url="https://github.com/daviddrysdale/python-phonenumbers"
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-protobuf')
source=("git+https://github.com/daviddrysdale/python-phonenumbers.git#tag=v$pkgver")
sha512sums=('649e116f213540656c7ae15d52b65746eebb2f74cfa916ed074801562f1300f56d2728f352f2fa0e6acd8357a965dd0c354275d796c50b1b8e240bcf13ff2e46')

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
