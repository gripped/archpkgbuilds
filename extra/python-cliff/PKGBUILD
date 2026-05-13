# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-cliff
pkgver=4.14.0
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
sha512sums=('0a83dcc60e9ddd68c29fc0fd3330ffc272440467cc27e9560d95223369e2cc5ff135a7446599a10e557af0985331c700f450b6fe071d9c0c84276630788031bb')

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
