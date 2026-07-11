# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-cliff
pkgver=4.15.0
pkgrel=1
pkgdesc="Command Line Interface Formulation Framework"
arch=('any')
url="https://docs.openstack.org/cliff/latest/"
license=('Apache-2.0')
depends=('python-autopage' 'python-cmd2' 'python-prettytable' 'python-stevedore' 'python-yaml')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pbr')
checkdepends=('python-fixtures' 'python-stestr' 'python-sphinx' 'python-testtools')
options=('!emptydirs')
source=("git+https://github.com/openstack/cliff.git#tag=$pkgver")
sha512sums=('22447ec77a3a3bc632e25a493dba1f4142e02a0a49cf9099510506d3367d45f9afb75cee51ec96386ffa88299e4bf0355f5a95e7c866a8f4f96907205c56d569')

build() {
  cd cliff
  python -m build --wheel --no-isolation
}

check() {
  cd cliff
  PYTHONPATH="$PWD/src" stestr run
}

package() {
  cd cliff
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
