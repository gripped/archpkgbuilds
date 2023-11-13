# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-i18n
pkgver=6.1.0
_commit=e356fe9059b03b7b22b12e0d3227e163a64bfbd2
pkgrel=2
pkgdesc="Oslo i18n library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.i18n/$pkgver"
license=('Apache')
depends=('python-pbr')
makedepends=('git' 'python-setuptools')
checkdepends=('python-stestr' 'python-oslotest' 'python-testscenarios' 'python-oslo-config')
source=("git+https://github.com/openstack/oslo.i18n.git#commit=$_commit"
        "fix-tests-extra-warning.patch")
sha512sums=('SKIP'
            '445b03985fafef0e4db856afe54772bb8b23b328f0a0166277c5aba9e899e2c6596737c45c11f0581fa3093853048134eac1c894227e88be463a4d0affe849e8')

prepare() {
  cd oslo.i18n
  patch -Np1 -i ../fix-tests-extra-warning.patch
}

build() {
  cd oslo.i18n
  python setup.py build
}

check() {
  cd oslo.i18n
  stestr run
}

package() {
  cd oslo.i18n
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
