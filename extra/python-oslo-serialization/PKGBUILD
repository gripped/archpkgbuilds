# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-oslo-serialization
pkgver=5.4.1
pkgrel=1
pkgdesc="Oslo Serialization library"
arch=('any')
url="https://docs.openstack.org/developer/oslo.serialization"
license=('Apache')
depends=('python-pbr' 'python-msgpack' 'python-oslo-utils')
makedepends=('git' 'python-setuptools')
checkdepends=('python-stestr' 'python-oslotest' 'python-oslo-i18n')
source=("git+https://github.com/openstack/oslo.serialization.git#tag=$pkgver")
sha512sums=('5dc0f176a82c1230dff6fe81b424efcc35b1d17585b8df5f33fe5c8734d8a4987faa1650d05ea84936174879e9a12d7347fcda9e765c718ef40e9b9e60801b69')

prepare() {
  cd oslo.serialization
  # We have system tzdata
  sed -i '/tzdata/d' requirements.txt
}

build() {
  cd oslo.serialization
  python setup.py build
}

check() {
  cd oslo.serialization
  stestr run
}

package() {
  cd oslo.serialization
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
