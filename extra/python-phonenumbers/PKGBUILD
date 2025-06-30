# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-phonenumbers
pkgver=9.0.7
pkgrel=1
pkgdesc="Python version of Google's common library for parsing, formatting, storing and validating international phone numbers"
arch=('any')
url="https://github.com/daviddrysdale/python-phonenumbers"
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-protobuf')
source=("git+https://github.com/daviddrysdale/python-phonenumbers.git#tag=v$pkgver")
sha512sums=('39c564040838e5dbb4443a18b0f2cf760bbaa9d801667f89e704f3e939f83dbf8595542bc075bd83a1be17ea743018d9a35a87791718c1f2281df19cd365a469')

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
