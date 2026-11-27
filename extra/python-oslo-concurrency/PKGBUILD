# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-concurrency
pkgver=7.7.0
pkgrel=1
pkgdesc="OpenStack library for all concurrency-related code"
arch=('any')
url="https://pypi.python.org/pypi/oslo.concurrency/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-oslo-config' 'python-oslo-i18n' 'python-oslo-utils'
         'python-fasteners' 'python-debtcollector')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-oslotest' 'python-stestr')
source=("git+https://github.com/openstack/oslo.concurrency.git#tag=$pkgver")
sha512sums=('95f0dc273e8be2baab27e1233608d1cf8bcbb85ec724aad1acba795e85d185c07f960b46e706d30ebfd11041fe2bfaf514cb9274b0062ac74eaf23ea5d1a550b')

build() {
  cd oslo.concurrency
  python -m build --wheel --no-isolation
}

check() {
  cd oslo.concurrency
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # python-eventlet is removed: drop its test module
  rm -f oslo_concurrency/tests/unit/test_lockutils_eventlet.py
  test-env/bin/lockutils-wrapper test-env/bin/python -m stestr run --exclude-regex oslo_concurrency.tests.unit.test_processutils.PrlimitTestCase.test_core_size
}

package() {
  cd oslo.concurrency
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
