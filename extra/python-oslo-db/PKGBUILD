# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-db
pkgver=17.0.0
pkgrel=1
pkgdesc="OpenStack Database Pattern Library"
arch=('any')
url="https://pypi.org/project/oslo.db/$pkgver/"
license=('Apache-2.0')
depends=('python-pbr' 'python-alembic' 'python-debtcollector' 'python-oslo-i18n'
         'python-oslo-config' 'python-oslo-utils' 'python-sqlalchemy1.4' 'python-stevedore')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-testresources' 'python-testscenarios' 'python-eventlet' 'python-oslotest'
              'python-oslo-context' 'python-stestr' 'python-testtools' 'pifpaf' 'python-psycopg2')
optdepends=('python-testresources: for sqlalchemy test fixtures'
            'python-testscenarios: for sqlalchemy test fixtures')
options=('!emptydirs')
source=("git+https://github.com/openstack/oslo.db.git#tag=$pkgver")
sha512sums=('bbefc19c6a162a0a1e1769b00c7d4da52674732741e26ef44b99796d3045f1f068c9e5cc95b2a3297492cda6d488a170c9cb093f2a4dfb359d4602cd57dc55e6')

build() {
  cd oslo.db
  python -m build --wheel --no-isolation
}

check() {
  cd oslo.db
  SQLALCHEMY_SILENCE_UBER_WARNING=1 stestr run
}

package() {
  cd oslo.db
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
