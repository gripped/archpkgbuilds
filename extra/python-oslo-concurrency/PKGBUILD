# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-concurrency
pkgver=7.1.0
pkgrel=1
pkgdesc="OpenStack library for all concurrency-related code"
arch=('any')
url="https://pypi.python.org/pypi/oslo.concurrency/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-oslo-config' 'python-oslo-i18n' 'python-oslo-utils'
         'python-fasteners' 'python-debtcollector')
makedepends=('git' 'python-setuptools')
checkdepends=('python-oslotest' 'python-stestr' 'python-eventlet')
source=(
  "git+https://github.com/openstack/oslo.concurrency.git#tag=$pkgver"
  "$pkgname-python-3.14.patch"
)
sha512sums=('391586304f25a4537964ba604236c1e1b027a16e5b89c461272171ff53bdd9cc745bef09131557121773a772bdc218981138b585626fadff0be5422afe1a2f13'
            '031c3afbc17f5bc3a8f91275d81fec22c1a70f09a9187bd7e46fae2147edeaba31d51f23d3a10f86121be60a01fa88049a79cf4a1a32efbf5b98ea2d9be9109b')

prepare() {
  cd oslo.concurrency
  patch -Np1 < ../$pkgname-python-3.14.patch
}

build() {
  cd oslo.concurrency
  python setup.py build
}

check() {
  cd oslo.concurrency
  python setup.py install --root="tmp_install" --optimize=1
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/tmp_install/usr/lib/python${python_version}/site-packages" PATH="$PWD/tmp_install/usr/bin:$PATH" \
    TEST_EVENTLET=0 lockutils-wrapper stestr run --exclude-regex oslo_concurrency.tests.unit.test_processutils.PrlimitTestCase.test_core_size
  PYTHONPATH="$PWD/tmp_install/usr/lib/python${python_version}/site-packages" PATH="$PWD/tmp_install/usr/bin:$PATH" \
    TEST_EVENTLET=1 lockutils-wrapper stestr run --exclude-regex oslo_concurrency.tests.unit.test_processutils.PrlimitTestCase.test_core_size
}

package() {
  cd oslo.concurrency
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
