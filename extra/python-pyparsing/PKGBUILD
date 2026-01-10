# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Arvid Ephraim Picciani <aep@exys.org>
# Contributor: Michael Krauss <hippodriver@gmx.net>

pkgname=python-pyparsing
pkgver=3.3.1
pkgrel=3
pkgdesc='General parsing module for Python'
arch=(any)
url='https://github.com/pyparsing/pyparsing/'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-flit-core
)
checkdepends=(
  python-jinja
  python-railroad-diagrams
  python-pytest
  python-matplotlib
)
optdepends=('python-railroad-diagrams: for generating Railroad Diagrams'
            'python-jinja: for generating Railroad Diagrams')
source=("$pkgname::git+https://github.com/pyparsing/pyparsing.git#tag=$pkgver")
sha512sums=('d1c97675dbb79e48f67a52642865983d7f42b6b983ec19bb07047eaa3d921c47276a7a63baf17b8b46b00d33c5452bbee249d06de359c502b37c509d3c66276a')
b2sums=('51ca58fc23b9eae010f8a7796abf5c0c3c5332936c14845d670dfd4dc4af3056d4cf4fa31e8dcbe7e0fbb6e953dc973db2d7544cfd7dcad75492221184a400bd')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
