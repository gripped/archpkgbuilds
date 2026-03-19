# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-context
pkgver=6.2.0
pkgrel=1
pkgdesc="OpenStack Context library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.context/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer')
checkdepends=('python-oslotest' 'python-stestr')
source=("git+https://github.com/openstack/oslo.context.git#tag=$pkgver")
sha512sums=('f41cd430e9cdf2ee5214d05a46cdd428badabdd1f6af0b811c223ccfbc4a1ca93400cb7d1654468b2226f2860cc17b11ffbf0ba4a2179f7bebee9ae51b1e76f4')

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
