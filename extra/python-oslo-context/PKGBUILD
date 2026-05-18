# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-context
pkgver=6.4.0
pkgrel=1
pkgdesc="OpenStack Context library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.context/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer')
checkdepends=('python-oslotest' 'python-stestr')
source=("git+https://github.com/openstack/oslo.context.git#tag=$pkgver")
sha512sums=('8a5895ff7f08176ee53fd3863280e087fab94c33aec91277339441c7b556a146c72d6c7a9a3058e276963da55c6e568b371d1c0576f0954ec9c0fa77bb84dc8d')

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
