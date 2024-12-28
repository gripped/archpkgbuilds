# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python-ulid-transform
pkgver=1.0.2
pkgrel=2
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
_tag=e65fd825b4b9aeac11a1bcf6f68109138c23ec91
source=(git+https://github.com/bdraco/ulid-transform.git#tag=${_tag})
b2sums=('93323e091cf03e2fb2aabcd2dff5ce9028cacc47600a17e086a33236c55dc8d764224c03114a9dab7077ba03edcd71730ab44b2c8a072f81b276f0ecbce510e8')

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
