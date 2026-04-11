# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-cliff
pkgver=4.13.3
pkgrel=1
pkgdesc="Command Line Interface Formulation Framework"
arch=('any')
url="https://docs.openstack.org/cliff/latest/"
license=('Apache-2.0')
depends=('python-autopage' 'python-cmd2' 'python-prettytable' 'python-stevedore' 'python-yaml')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pbr')
checkdepends=('python-stestr' 'python-sphinx' 'python-testscenarios')
options=('!emptydirs')
source=("git+https://github.com/openstack/cliff.git#tag=$pkgver")
sha512sums=('895e8e20a0614a15205afa1617fb83b98f98c1be593e8c23f76e4d6a2c8ca301cf17bc6677e3d654c16d97be00fba6cc999ee1a8398ed0c36dbf3d98d4f0c4a6')

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
