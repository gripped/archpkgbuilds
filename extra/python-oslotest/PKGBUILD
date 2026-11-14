# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-oslotest
pkgver=6.2.0
pkgrel=1
pkgdesc="Oslo test framework"
arch=('any')
url="https://github.com/openstack/oslotest"
license=('Apache-2.0')
depends=('python-fixtures' 'python-subunit' 'python-testtools')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pbr')
checkdepends=('python-oslo-config' 'python-stestr')
source=("git+https://github.com/openstack/oslotest.git#tag=$pkgver")
sha512sums=('634484c486579a0b42b3ed7966a5dcf628f904290fd21f09e25e09da831ac905a4c48db6ced586a0bba799a2c1173bc615451e4d3c94a286165f09553045e745')

build() {
  cd oslotest
  python -m build --wheel --no-isolation
}

check() {
  cd oslotest
  stestr run
}

package() {
  cd oslotest
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
