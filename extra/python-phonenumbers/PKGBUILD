# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-phonenumbers
pkgver=9.0.13
pkgrel=1
pkgdesc="Python version of Google's common library for parsing, formatting, storing and validating international phone numbers"
arch=('any')
url='https://github.com/daviddrysdale/python-phonenumbers'
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-protobuf')
source=("git+https://github.com/daviddrysdale/python-phonenumbers.git#tag=v$pkgver")
sha512sums=('c0eeaaeffb64638eb28c1d1dabfb885460f9515021452309df1e72d36dabf0747b0cd91f109ea131cab46b7697280a9264a4bd4994edaa4eac1f31e4d9035fd6')
b2sums=('b8343370425b8e2d95449825fe7cf5bfffc5f01c7c0a33bb79c5fcf9ff93a24f720d942628cfb0e98a6599bcdcf96a15686cd3abf3cadffa718a7dae49194908')

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
