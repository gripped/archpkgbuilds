# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-concurrency
pkgver=7.4.1
pkgrel=1
pkgdesc="OpenStack library for all concurrency-related code"
arch=('any')
url="https://pypi.python.org/pypi/oslo.concurrency/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-oslo-config' 'python-oslo-i18n' 'python-oslo-utils'
         'python-fasteners' 'python-debtcollector')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-oslotest' 'python-stestr' 'python-eventlet')
source=(
  "git+https://github.com/openstack/oslo.concurrency.git#tag=$pkgver"
  "$pkgname-python-3.14.patch"
)
sha512sums=('264dc398c5b98969b2cafc41494b92f9d89ad8d98fa52d6394a8f62936c54732314bd172f1b2a05b8c14070f302302fe3fcdc8cb4f69ff51dfd667997267bc0b'
            '1fc62ee511580e74f167037a0a3cc6f563a54a208c3de4fac067d9c0a10e48600aaf34166cf31249a1236e9fbaa59fc5a6dac09abe6fea9dcee0f31a0c29325f')

prepare() {
  cd oslo.concurrency
  patch -Np1 < ../$pkgname-python-3.14.patch
}

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
