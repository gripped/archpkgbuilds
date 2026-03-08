# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-db
pkgver=12.3.3
pkgrel=1
pkgdesc="OpenStack Database Pattern Library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.db/$pkgver"
license=('Apache')
depends=('python-pbr' 'python-alembic' 'python-debtcollector' 'python-oslo-i18n'
         'python-oslo-config' 'python-oslo-utils' 'python-sqlalchemy1.4' 'python-stevedore')
makedepends=('git' 'python-setuptools')
checkdepends=('python-testresources' 'python-testscenarios' 'python-eventlet' 'python-oslotest'
              'python-oslo-context' 'python-stestr' 'python-testtools' 'pifpaf')
optdepends=('python-testresources: for sqlalchemy test fixtures'
            'python-testscenarios: for sqlalchemy test fixtures')
options=('!emptydirs')
source=("git+https://github.com/openstack/oslo.db.git#tag=$pkgver")
sha512sums=('f43da04c811e016262b6cf1f24d1c82bd2ff9dc49cd4143ed71bc526c3e502d1fa4cd104e137daeb0b80b3be31bb9add3b899e7a74b1642834f677c391628d30')

prepare() {
  cd oslo.db
  # remove sqlalchemy-migrate
  git cherry-pick -n 94d6e24ca19b0116eed00d5ccdb8a538918c6dcf
}

build() {
  cd oslo.db
  python setup.py build
}

check() {
  cd oslo.db
  stestr run
}

package() {
  cd oslo.db
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
