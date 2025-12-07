# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python-ulid-transform
pkgver=1.5.2
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
_tag=ca43250ac30d5ce9fe1ad9de4e27c3263dd3a8d0
source=(git+https://github.com/bdraco/ulid-transform.git#tag=${_tag})
b2sums=('6d22e8880563fe0240d3a50dfcb0729b7f434f3fe11eb4b308e1bad719f49368f4b4cbb01334a2c2951626f886d8ab2a6419ff5fe33e496323b99c107588f6a9')

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
