# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-concurrency
pkgver=7.6.0
pkgrel=1
pkgdesc="OpenStack library for all concurrency-related code"
arch=('any')
url="https://pypi.python.org/pypi/oslo.concurrency/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-oslo-config' 'python-oslo-i18n' 'python-oslo-utils'
         'python-fasteners' 'python-debtcollector')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-oslotest' 'python-stestr' 'python-eventlet')
source=("git+https://github.com/openstack/oslo.concurrency.git#tag=$pkgver")
sha512sums=('a974b649d362f74e3ff21d04c546998381647058f44615c4fb4d9bafbd3011cfe012ec0dd64fb05752d463b66965674ee4e3f60df4b9202dabbecd07c36e60a2')

build() {
  cd oslo.concurrency
  python -m build --wheel --no-isolation
}

check() {
  cd oslo.concurrency
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  TEST_EVENTLET=0 test-env/bin/lockutils-wrapper test-env/bin/python -m stestr run --exclude-regex oslo_concurrency.tests.unit.test_processutils.PrlimitTestCase.test_core_size
  TEST_EVENTLET=1 test-env/bin/lockutils-wrapper test-env/bin/python -m stestr run --exclude-regex oslo_concurrency.tests.unit.test_processutils.PrlimitTestCase.test_core_size
}

package() {
  cd oslo.concurrency
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
