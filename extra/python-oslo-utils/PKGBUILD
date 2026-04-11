# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-utils
pkgver=9.2.0
pkgrel=1
pkgdesc="Oslo Utility library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.utils/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-iso8601' 'python-oslo-i18n' 'python-netaddr'
         'python-debtcollector' 'python-pyparsing' 'python-packaging' 'python-yaml' 'python-psutil')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-eventlet' 'python-testscenarios' 'python-testtools' 'python-oslotest'
              'python-ddt' 'python-stestr' 'qemu-img')
source=("git+https://github.com/openstack/oslo.utils.git#tag=$pkgver")
sha512sums=('22262e533f45d6a9fd22784e084c384b6c72e907936c667b1963e67da7d4a61e89522efb3cf85b2d96764b86448174e60e5eefe91e38536be032233855d12ade')

prepare() {
  cd oslo.utils
  # We have system tzdata
  sed -i '/tzdata/d' requirements.txt
}

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
