# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python-ulid-transform
pkgver=0.12.0
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
_tag=8c88deeea302b3991c1550471b63f7ed11bfe4d9
source=(git+https://github.com/bdraco/ulid-transform.git#tag=${_tag})
b2sums=('56220995740fa3fdc884d7b4fe7cf1f712c16adac06d44068be10a97cb61cc408350fc58186df35c8472cce9e55db6724336102d3db1eafaad00e76a08e95fe1')

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
