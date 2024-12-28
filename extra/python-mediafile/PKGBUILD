# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-mediafile
pkgver=0.13.0
pkgrel=1
pkgdesc='Elegant audio file tagging'
arch=(any)
url=https://github.com/beetbox/mediafile
license=(MIT)
depends=(
  python-mutagen
  python-filetype
)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
_tag=e1de3640e253ff88f00e8495d3b7626ff6b3e2b8
source=(git+https://github.com/beetbox/mediafile.git#tag=${_tag})
sha256sums=('8b9a86f0ca50f95dda715f475b03cfe081db48648fe58faaff0e65de429370e8')

pkgver() {
  cd mediafile
  git describe --tags | sed 's/^v//'
}

build() {
  cd mediafile
  python -m build --wheel --no-isolation
}

check() {
  cd mediafile
  python -m unittest discover -vs .
}

package() {
  python -m installer --destdir="${pkgdir}" mediafile/dist/*.whl
  install -Dm 644 mediafile/LICENSE -t "${pkgdir}"/usr/share/licenses/python-mediafile
}

# vim: ts=2 sw=2 et:
