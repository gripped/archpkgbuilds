# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-oslo-serialization
pkgver=5.10.0
pkgrel=1
pkgdesc="Oslo Serialization library"
arch=('any')
url="https://docs.openstack.org/developer/oslo.serialization"
license=('Apache-2.0')
depends=('python-msgpack' 'python-oslo-utils')
makedepends=('git' 'python-build' 'python-installer' 'python-pbr')
checkdepends=('python-stestr' 'python-oslotest' 'python-oslo-i18n')
source=("git+https://github.com/openstack/oslo.serialization.git#tag=$pkgver")
sha512sums=('6d23e9f441e109d3265efd4c330266aea17d99979c60c27074a2dade61c48dcc9a4b259b55871675aeab6cca5d033d00855d0ed88e9491ac0c99218b17bbfdbe')

build() {
  cd oslo.serialization
  python -m build -nw
}

check() {
  cd oslo.serialization
  stestr run
}

package() {
  cd oslo.serialization
  python -m installer --destdir "$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
