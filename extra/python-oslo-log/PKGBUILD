# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-log
pkgver=8.3.0
pkgrel=1
pkgdesc="Oslo Logging Library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.log/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-oslo-config' 'python-oslo-context' 'python-oslo-i18n'
         'python-oslo-utils' 'python-oslo-serialization' 'python-debtcollector'
         'python-dateutil')
makedepends=('git' 'python-build' 'python-installer')
checkdepends=('python-stestr' 'python-testtools' 'python-oslotest' 'python-eventlet')
source=("git+https://github.com/openstack/oslo.log.git#tag=$pkgver")
sha512sums=('0e981f9a62b08d022b236a35601e6aaa6a10e6429cfa2ec1c10889095dd2ccd25c8eb8638472f096ee0cd17a36621b11a55d0052806c9245b5b453f531836a25')

build() {
  cd oslo.log
  python -m build --wheel --no-isolation
}

check() {
  cd oslo.log
  stestr run
}

package() {
  cd oslo.log
  python -m installer --destdir "$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
