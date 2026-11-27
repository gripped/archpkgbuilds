# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-log
pkgver=8.4.0
pkgrel=1
pkgdesc="Oslo Logging Library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.log/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-oslo-config' 'python-oslo-context' 'python-oslo-i18n'
         'python-oslo-utils' 'python-oslo-serialization' 'python-debtcollector'
         'python-dateutil')
makedepends=('git' 'python-build' 'python-installer')
checkdepends=('python-stestr' 'python-testtools' 'python-oslotest')
source=("git+https://github.com/openstack/oslo.log.git#tag=$pkgver")
sha512sums=('50f23ea33bc90f70a5967e66194598a5b40d1e068f814a6e6b94661c3c38be89fea287dca72fe69b546f479d7b670d4f7851998cde8d159c4590cb5f7116082a')

build() {
  cd oslo.log
  python -m build --wheel --no-isolation
}

check() {
  cd oslo.log
  # python-eventlet is removed: drop its test module (module-level
  # import). Runtime only touches eventlet behind a sys.modules
  # guard in _fix_eventlet_logging().
  rm -f oslo_log/tests/unit/test_pipe_mutex.py
  stestr run
}

package() {
  cd oslo.log
  python -m installer --destdir "$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
