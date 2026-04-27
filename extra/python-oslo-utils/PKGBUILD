# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-utils
pkgver=10.0.1
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
sha512sums=('720107f99af518ca18defd10952da44f7248b374b55c087916b79b9e125c382a8ebb4b762252ebe0c2cadc5337293e2f2044f3aa8d4d9b62721f1ee179d26bd1')

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
