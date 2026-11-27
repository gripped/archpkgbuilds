# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-context
pkgver=6.6.0
pkgrel=1
pkgdesc="OpenStack Context library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.context/$pkgver"
license=('Apache-2.0')
depends=('python-pbr')
makedepends=('git' 'python-build' 'python-installer')
checkdepends=('python-oslotest' 'python-stestr')
source=("git+https://github.com/openstack/oslo.context.git#tag=$pkgver")
sha512sums=('d354fc98a9b542d4a95a9f8ae21138553e670cbaa691e9028d2e311dced046c67c3d33e104abd3e87b8713e58b8dd7134a262f1daad199d5900b2d4439ba9bee')

build() {
  cd oslo.context
  python -m build --wheel --no-isolation
}

check() {
  cd oslo.context
  stestr run
}

package() {
  cd oslo.context
  python -m installer --destdir "$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
