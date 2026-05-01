# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-db
pkgver=17.2.0
pkgrel=1
pkgdesc="OpenStack Database Pattern Library"
arch=('any')
url="https://pypi.org/project/oslo.db/$pkgver/"
license=('Apache-2.0')
depends=('python-pbr' 'python-alembic' 'python-debtcollector' 'python-oslo-i18n'
         'python-oslo-config' 'python-oslo-utils' 'python-sqlalchemy' 'python-stevedore')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-testresources' 'python-testscenarios' 'python-oslotest'
              'python-oslo-context' 'python-stestr' 'python-testtools' 'pifpaf' 'python-psycopg2'
              'python-aiosqlite')
optdepends=('python-testresources: for sqlalchemy test fixtures'
            'python-testscenarios: for sqlalchemy test fixtures')
options=('!emptydirs')
source=("git+https://github.com/openstack/oslo.db.git#tag=$pkgver")
sha512sums=('7cdd390845cd75f65032dae6ac5cb5fc3a440c9dbffb663744c615b094917be730bd678c8e18ad3c87febbb70c5bccb82fea20085e0df1349b967e5bf444239e')

build() {
  cd oslo.db
  python -m build --wheel --no-isolation
}

check() {
  cd oslo.db
  # SQLAlchemy 2 renders this IN clause differently, but behavior is unchanged.
  SQLALCHEMY_SILENCE_UBER_WARNING=1 stestr run --exclude-regex 'oslo_db.tests.sqlalchemy.test_utils.TestModelQuery.test_project_filter_allow_none'
}

package() {
  cd oslo.db
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
