# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-debtcollector
pkgver=3.0.0
pkgrel=6
arch=('any')
pkgdesc='A collection of Python deprecation patterns and strategies that help you collect your technical debt in a non-destructive manner.'
url='https://docs.openstack.org/developer/debtcollector'
license=('Apache-2.0')
depends=('python-wrapt')
makedepends=('git' 'python-build' 'python-installer' 'python-pbr' 'python-setuptools' 'python-wheel')
checkdepends=('python-stestr')
source=("git+https://github.com/openstack/debtcollector.git#tag=$pkgver")
sha512sums=('477af894df32fc783312e057bed32db820475e490c9fae51f44c693b0d226eb7505da22f14021bbe5854b832137ec2f8766e10529061d44cd1a3b9a564fda6e4')

export PBR_VERSION=$pkgver

build() {
  cd debtcollector
  python -m build --wheel --no-isolation
}

check() {
  cd debtcollector
  stestr run
}

package() {
  cd debtcollector
  python -m installer --destdir="$pkgdir" dist/*.whl
}
