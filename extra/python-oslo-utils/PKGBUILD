# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-utils
pkgver=8.1.0
pkgrel=1
pkgdesc="Oslo Utility library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.utils/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-iso8601' 'python-oslo-i18n' 'python-netaddr'
         'python-debtcollector' 'python-pyparsing' 'python-packaging' 'python-yaml' 'python-psutil')
makedepends=('git' 'python-setuptools')
checkdepends=('python-eventlet' 'python-testscenarios' 'python-testtools' 'python-oslotest'
              'python-ddt' 'python-stestr' 'qemu-img')
source=("git+https://github.com/openstack/oslo.utils.git#tag=$pkgver")
sha512sums=('c87cf6e8f5c28f6d7dfc7ae868fad3329db4499d4808852f6f263dc0ee42b8c2a77dd327c7ab5b487d321d074dc5b9279d3106d726c1a807dd7bc2756737aa2b')

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
