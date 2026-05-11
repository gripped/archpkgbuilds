# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-db
pkgver=17.4.0
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
sha512sums=('10a4d2584bfcb0f24e3d0da9ea94ee6be0206bcadeba023254c749a92ecef9daf72963bdd36413450d807677736ee7582df9ba986f9f1602fa59e142c4b62822')

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
