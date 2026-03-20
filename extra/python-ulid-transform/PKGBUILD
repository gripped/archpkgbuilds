# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python-ulid-transform
pkgver=1.5.3
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
_tag=85efb7a6aa3956ec60996b5aaf74fe246b78853c
source=(git+https://github.com/bdraco/ulid-transform.git#tag=${_tag})
b2sums=('8f1300a4f8d1d30a48ce8d5b87efd17a40393d6f164c86fccff716a7afec194fdf89f270007e45410dc60ae2433300f8356febbd591778247631ad69d11eaf84')

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
