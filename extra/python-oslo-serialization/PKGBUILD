# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-oslo-serialization
pkgver=5.9.0
pkgrel=1
pkgdesc="Oslo Serialization library"
arch=('any')
url="https://docs.openstack.org/developer/oslo.serialization"
license=('Apache-2.0')
depends=('python-msgpack' 'python-oslo-utils')
makedepends=('git' 'python-build' 'python-installer' 'python-pbr')
checkdepends=('python-stestr' 'python-oslotest' 'python-oslo-i18n')
source=("git+https://github.com/openstack/oslo.serialization.git#tag=$pkgver")
sha512sums=('a7a2c0c02986b2c247d00b1d561e00d25e3e3ad6657eb37b27cc8296e64db2baca7214e864c8e4f7d1440d28f6b49ca57fcdb5cfed9ad9fef64e827557ba197f')

prepare() {
  cd oslo.serialization
  # We have system tzdata
  sed -i '/tzdata/d' requirements.txt
}

build() {
  cd oslo.serialization
  python -m build -nw
}

check() {
  cd oslo.serialization
  stestr run
}

package() {
  cd oslo.serialization
  python -m installer --destdir "$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
