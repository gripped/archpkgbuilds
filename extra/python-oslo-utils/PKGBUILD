# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-utils
pkgver=8.0.0
pkgrel=1
pkgdesc="Oslo Utility library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.utils/$pkgver"
license=('Apache-2.0')
depends=('python-iso8601' 'python-oslo-i18n' 'python-netaddr' 'python-netifaces'
         'python-debtcollector' 'python-pyparsing' 'python-packaging' 'python-yaml' 'python-psutil')
makedepends=('git' 'python-setuptools')
checkdepends=('python-eventlet' 'python-testscenarios' 'python-testtools' 'python-oslotest'
              'python-ddt' 'python-stestr' 'qemu-img')
source=("git+https://github.com/openstack/oslo.utils.git#tag=$pkgver")
sha512sums=('176bf0dca32062db5de5ef43699ff686901726bc5925d658bb83515bb5cc778ed96c15bf6cb8d981d4fa25f8407a15e0c4f69fb5250c5ebcfbedc76e1941c90d')

prepare() {
  cd oslo.utils
  # We have system tzdata
  sed -i '/tzdata/d' requirements.txt
}

build() {
  cd oslo.utils
  python setup.py build
}

check() {
  cd oslo.utils
  stestr run
}

package() {
  cd oslo.utils
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
