# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-concurrency
pkgver=7.5.0
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
sha512sums=('35934d2a3c7f22425f0798cf6eda0e4cba02182e81f2774a0ac4ad8c833cdd7d8fbf4987069bf80cf403f17dfdde6ae765602d94f03edea4fceac7ca91b3b99a')

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
