# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-oslotest
pkgver=6.0.0
pkgrel=1
pkgdesc="Oslo test framework"
arch=('any')
url="https://github.com/openstack/oslotest"
license=('Apache-2.0')
depends=('python-fixtures' 'python-subunit' 'python-testtools')
makedepends=('git' 'python-pbr')
checkdepends=('python-oslo-config' 'python-stestr')
source=("git+https://github.com/openstack/oslotest.git#tag=$pkgver")
sha512sums=('0d33d90bd3bcc034d642f1acc1ace24c64090af61230ef0ec943569affe95ef7654b5caf59ff3811b3d541500fdcb47139a1a726f50bd4000ad2251bf4e042d0')

build() {
  cd oslotest
  python setup.py build
}

check() {
  cd oslotest
  stestr run
}

package() {
  cd oslotest
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
