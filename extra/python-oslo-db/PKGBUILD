# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-db
pkgver=14.1.0
pkgrel=1
pkgdesc="OpenStack Database Pattern Library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.db/$pkgver"
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
sha512sums=('b59ceb965ea31c14e0da51500365c373206d5086ecf122898a583f396f79821f4f695ddea34c9876c82a9e2d8d6611d1f420233881acafc720659aaa4c0da52d')

build() {
  cd oslo.db
  python -m build --wheel --no-isolation
}

check() {
  cd oslo.db
  stestr run
}

package() {
  cd oslo.db
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
