# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-log
pkgver=7.2.1
pkgrel=1
pkgdesc="Oslo Logging Library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.log/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-oslo-config' 'python-oslo-context' 'python-oslo-i18n'
         'python-oslo-utils' 'python-oslo-serialization' 'python-debtcollector' 'python-pyinotify'
         'python-dateutil')
makedepends=('git' 'python-build' 'python-installer')
checkdepends=('python-stestr' 'python-testtools' 'python-oslotest' 'python-eventlet')
source=("git+https://github.com/openstack/oslo.log.git#tag=$pkgver")
sha512sums=('43758f0614e162f593f1aeb0711da8ae4e588c1b269a5cb739d4bf73799152ca754d6436914a9b12e6f4351767a6418d80e4670e445c00cf4a9d9cf4a4f01233')

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
