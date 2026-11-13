# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-utils
pkgver=10.3.0
pkgrel=1
pkgdesc="Oslo Utility library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.utils/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-iso8601' 'python-oslo-i18n' 'python-netaddr'
         'python-pyparsing' 'python-packaging' 'python-yaml' 'python-psutil')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-testscenarios' 'python-testtools' 'python-oslotest'
              'python-ddt' 'python-stestr' 'python-cryptography' 'qemu-img')
optdepends=('python-cryptography: LUKS image inspection support')
source=("git+https://github.com/openstack/oslo.utils.git#tag=$pkgver")
sha512sums=('b343ced864b62baf0b91e3701e8310dea4ca0e9c08e2533622e9d4cf4fa1c3d301b47d47238a1d7b98468e8be214a5bd5ca7d3a7367e879a9c8bfb9139a579a5')

build() {
  cd oslo.utils
  python -m build --wheel --no-isolation
}

check() {
  cd oslo.utils
  # python-eventlet is removed: drop its test module
  rm -f oslo_utils/tests/test_eventletutils.py
  stestr run
}

package() {
  cd oslo.utils
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
