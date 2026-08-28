# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-log
pkgver=8.3.1
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
sha512sums=('9c05e0549e544ff0bb99d1f07357dc9e322edf3dc54f7ceafc61d7fe0a02f772bf56ba030eb35fedba0459eff79c3550c6f38b7d95e794f938a996458b74a24a')

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
