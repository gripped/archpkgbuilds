# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-i18n
pkgver=6.7.0
pkgrel=1
pkgdesc="Oslo i18n library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.i18n/$pkgver"
license=('Apache-2.0')
depends=('python-pbr')
makedepends=('git' 'python-build' 'python-installer')
checkdepends=('python-stestr' 'python-oslotest' 'python-testscenarios' 'python-oslo-config')
source=("git+https://github.com/openstack/oslo.i18n.git#tag=$pkgver"
        "fix-tests-extra-warning.patch")
sha512sums=('07f07ce63a1f2f52c290de6f88670b1cf8df089610aadd33eb4aa0db54fa5be18e21ae32b52f7f682e62546b45ff5b1275f3293843617f474ef373fbdf37c95f'
            '445b03985fafef0e4db856afe54772bb8b23b328f0a0166277c5aba9e899e2c6596737c45c11f0581fa3093853048134eac1c894227e88be463a4d0affe849e8')

prepare() {
  cd oslo.i18n
  patch -Np1 -i ../fix-tests-extra-warning.patch
}

build() {
  cd oslo.i18n
  python -m build -nw
}

check() {
  cd oslo.i18n
  stestr run
}

package() {
  cd oslo.i18n
  python -m installer --destdir "$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
