# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-log
pkgver=5.5.0
_commit=a892465f1947b952c7d0db468b09a9dc7e8f40bc
pkgrel=1
pkgdesc="Oslo Logging Library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.log/$pkgver"
license=('Apache')
depends=('python-pbr' 'python-oslo-config' 'python-oslo-context' 'python-oslo-i18n'
         'python-oslo-utils' 'python-oslo-serialization' 'python-debtcollector' 'python-pyinotify'
         'python-dateutil')
makedepends=('git' 'python-setuptools')
checkdepends=('python-stestr' 'python-testtools' 'python-oslotest' 'python-eventlet')
source=("git+https://github.com/openstack/oslo.log.git#commit=$_commit")
sha512sums=('130e80846055d918ddb6d91af879a31aef804613218e708aa073f474f109d7382fbd5e6bbe1a0540a3bb7f0910b978c51c58e70a207da3939d8fa27eddf5c7c3')

build() {
  cd oslo.log
  python setup.py build
}

check() {
  cd oslo.log
  stestr run
}

package() {
  cd oslo.log
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
