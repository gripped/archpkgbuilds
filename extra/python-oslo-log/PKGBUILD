# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-log
pkgver=8.0.0
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
sha512sums=('5c2409f65e77c361bd515520140863c502c38e3965bcc87663adca7d52af43d9a9330fa9b5e4a22c0ba8cc9fef3e6a3794250039c031cf26ec057fde1b635a56')

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
