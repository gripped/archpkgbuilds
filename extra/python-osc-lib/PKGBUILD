# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-osc-lib
pkgver=3.1.0
pkgrel=2
pkgdesc="OpenStackClient Library"
arch=('any')
url="https://docs.openstack.org/osc-lib/latest/"
license=('Apache')
depends=('python-pbr' 'python-cliff' 'python-keystoneauth1' 'python-openstacksdk' 'python-oslo-i18n'
         'python-oslo-utils' 'python-requests' 'python-stevedore')
makedepends=('git' 'python-setuptools')
checkdepends=('python-oslotest' 'python-requests-mock' 'python-stestr' 'python-testrepository'
              'python-testtools')
source=("git+https://github.com/openstack/osc-lib.git#tag=$pkgver")
sha512sums=('528b7120fce3214899db6c5ae171f44e9bc44fd2df3a41323ec44075bbe93327784f48816b96c68d98a9703ea14ff458aa9952df342e3552698909a49a4be7a7')

build() {
  cd osc-lib
  python setup.py build
}

check() {
  cd osc-lib
  stestr run
}

package() {
  cd osc-lib
  python setup.py install --root="$pkgdir" --optimize=1
}
