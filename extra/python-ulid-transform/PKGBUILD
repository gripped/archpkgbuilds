# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python-ulid-transform
pkgver=1.4.0
pkgrel=1
pkgdesc='Create and transform ULIDs'
arch=(x86_64)
url=https://github.com/bdraco/ulid-transform
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
)
makedepends=(
  cython
  git
  python-build
  python-installer
  python-poetry-core
  python-setuptools
  python-wheel
)
_tag=33e4ec44e45dcc0d390c39aebabadf6a03fba201
source=(git+https://github.com/bdraco/ulid-transform.git#tag=${_tag})
b2sums=('6645fbaef684f8f35c3bd8b394f85f024ed57096ea3cc44d8092f855be1059480474cde2f1877c291403b2ae829cc0a1541d03851c71e358199ebda322bab772')

pkgver() {
  cd ulid-transform
  git describe --tags | sed 's/^v//'
}

build() {
  cd ulid-transform
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" ulid-transform/dist/*.whl
  install -Dm 644 ulid-transform/LICENSE -t "${pkgdir}"/usr/share/licenses/python-ulid-transform/
}

# vim: ts=2 sw=2 et:
