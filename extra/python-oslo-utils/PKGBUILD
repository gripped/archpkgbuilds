# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-utils
pkgver=10.1.0
pkgrel=1
pkgdesc="Oslo Utility library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.utils/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-iso8601' 'python-oslo-i18n' 'python-netaddr'
         'python-pyparsing' 'python-packaging' 'python-yaml' 'python-psutil')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-eventlet' 'python-testscenarios' 'python-testtools' 'python-oslotest'
              'python-ddt' 'python-stestr' 'python-cryptography' 'qemu-img')
optdepends=('python-cryptography: LUKS image inspection support')
source=("git+https://github.com/openstack/oslo.utils.git#tag=$pkgver")
sha512sums=('70ec0aac63a7ee5a7ea35a04a4e5faaa8fc1395a3b1f7260bc768aea1b956a03cc06109f57add6d2b04a7c70c8cbaf3831e75291315e4180ed7df2bc06589a9d')

build() {
  cd oslo.utils
  python -m build --wheel --no-isolation
}

check() {
  cd oslo.utils
  stestr run
}

package() {
  cd oslo.utils
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
