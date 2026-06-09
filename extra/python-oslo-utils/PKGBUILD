# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-utils
pkgver=10.1.1
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
sha512sums=('1ab535cc28906009c5df0464cf2dc24800ca3eb46e17ceb01f84a74dd54dc9bc1b80b5fc37891453db5d7d5dc2a257effd2e797ac3c579064f3bd20d21bf2201')

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
