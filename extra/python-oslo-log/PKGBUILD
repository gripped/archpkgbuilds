# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-log
pkgver=5.3.0
_commit=82a59af4360f7918c3427ad9d183dffb43cff541
pkgrel=1
pkgdesc="Oslo Logging Library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.log/$pkgver"
license=('Apache')
depends=('python-pbr' 'python-oslo-config' 'python-oslo-context' 'python-oslo-i18n'
         'python-oslo-utils' 'python-oslo-serialization' 'python-debtcollector' 'python-pyinotify'
         'python-dateutil')
makedepends=('git' 'python-setuptools')
checkdepends=('python-stestr' 'python-testtools' 'python-oslotest' 'python-eventlet')
source=("git+https://github.com/openstack/oslo.log.git#commit=$_commit"
        $pkgname-catch-runtimeerror.patch::https://opendev.org/openstack/oslo.log/commit/0b478677025f713f55b59ded213cc512f0a77b5a.patch)
sha512sums=('SKIP'
            '76b2dcd64af81a7a48aac5edad22dcc133d22eb73c4467fcc7b8e26cda8c33d83855cb7d67944cb53a2afc4ea8f504abc733c95a201e8b33f5ca68351fbb07ce')

prepare() {
  cd oslo.log
  patch -p1 -i ../$pkgname-catch-runtimeerror.patch
}

build() {
  cd oslo.log
  python setup.py build
}

check() {
  cd oslo.log
  stestr run
}

package() {
  cd oslo.log
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
