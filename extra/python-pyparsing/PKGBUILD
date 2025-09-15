# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Arvid Ephraim Picciani <aep@exys.org>
# Contributor: Michael Krauss <hippodriver@gmx.net>

pkgname=python-pyparsing
pkgver=3.2.4
pkgrel=1
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
sha512sums=('578578a734d95ff8ecbabcc7eca9213d7f093e4a0fae73f01ad85c4b73d408607061866504ee02c078c30a16c42e07408c70578ca19e68ff0e42acb3f643199f')
b2sums=('369ad7726f32c2bc9b905b4c9164bded89234a952a4fd2339baf1a89d3d0b718474baa527cccb42bc19ff60fc579316dac7adc9fa83f30c4f3ff1345a705ab35')

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
