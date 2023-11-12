# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-context
pkgver=5.2.0
_commit=5168ccdf014e70eacc70cc89c0f15ac1fb4b07e5
pkgrel=1
pkgdesc="OpenStack Context library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.context/$pkgver"
license=('Apache')
depends=('python-pbr' 'python-debtcollector')
makedepends=('git' 'python-setuptools')
checkdepends=('python-oslotest' 'python-stestr')
source=("git+https://github.com/openstack/oslo.context.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd oslo.context
  python setup.py build
}

check() {
  cd oslo.context
  stestr run
}

package() {
  cd oslo.context
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
