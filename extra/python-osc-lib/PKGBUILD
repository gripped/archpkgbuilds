# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-osc-lib
pkgver=4.5.0
pkgrel=1
pkgdesc="OpenStackClient Library"
arch=('any')
url="https://docs.openstack.org/osc-lib/latest/"
license=('Apache-2.0')
depends=('python-pbr' 'python-cliff' 'python-keystoneauth1' 'python-openstacksdk' 'python-oslo-i18n'
         'python-oslo-utils' 'python-requests' 'python-stevedore')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-fixtures' 'python-oslotest' 'python-requests-mock' 'python-stestr'
              'python-testrepository' 'python-testtools')
source=("git+https://github.com/openstack/osc-lib.git#tag=$pkgver")
sha512sums=('48abc726ae35c57e1feee3af3d8ab479ea4331cee998a919af40341d1b02ad1784d1532af582a16c5eaad502de30641ca9f9b6bc0c0aacddc41081b3e6f032df')

build() {
  cd osc-lib
  python -m build --wheel --no-isolation
}

check() {
  cd osc-lib
  stestr run
}

package() {
  cd osc-lib
  python -m installer --destdir="$pkgdir" dist/*.whl
}
