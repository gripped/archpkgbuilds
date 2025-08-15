# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-phonenumbers
pkgver=9.0.12
pkgrel=1
pkgdesc="Python version of Google's common library for parsing, formatting, storing and validating international phone numbers"
arch=('any')
url='https://github.com/daviddrysdale/python-phonenumbers'
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-protobuf')
source=("git+https://github.com/daviddrysdale/python-phonenumbers.git#tag=v$pkgver")
sha512sums=('72a97b138ad09f885b36db8ddace7b42ceec52c67679d077f147baa0de6d26b225b0d711905829cd0303f1516c096d33c7e1c87becc3ee0cf851a6b865e48e4c')
b2sums=('c746b50fd9eb83c644d5cecc1428b94e94f37f59c5d41e4daac7a5a01be3f7b6b9ec57ce3f9d2b65c4239854a5e9164fc604cce16825f7ab4c19a1908f766047')

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
