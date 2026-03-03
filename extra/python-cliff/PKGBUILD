# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-cliff
pkgver=4.13.2
pkgrel=1
pkgdesc="Command Line Interface Formulation Framework"
arch=('any')
url="https://docs.openstack.org/cliff/latest/"
license=('Apache')
depends=('python-autopage' 'python-cmd2' 'python-prettytable' 'python-stevedore' 'python-yaml')
makedepends=('git' 'python-setuptools' 'python-pbr')
checkdepends=('python-stestr' 'python-sphinx' 'python-testscenarios')
options=('!emptydirs')
source=("git+https://github.com/openstack/cliff.git#tag=$pkgver"
         python-3.14.patch)
sha512sums=('4ff3a7bc9ec0a00c7ca1a76bb60d24fc6f6bcd2948a26bb3fac21bab2a51f6ebd9e6581dba639bca4117c7e968eed316c3e12a7e2c3e0b94ea1dd99bb961a8f7'
            '1e54f20b56e495177e42a37b74d4e495f3bb9dbb91d2662dcdafd87464214c466ebb8ba1be32313e4b1312dc26b5ea59d8e99f5e227422bac03231310e42ddbf')

prepare() {
  cd cliff
  patch -p1 -i ../python-3.14.patch # Fix tests
  git cherry-pick --no-commit 391261c849c994ca2d3f42926497e633047ed8c7 # Fix sphinxext for Python 3.14
}

build() {
  cd cliff
  python setup.py build
}

check() {
  cd cliff
  PYTHONPATH="$PWD/build/lib" stestr run
}

package() {
  cd cliff
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
