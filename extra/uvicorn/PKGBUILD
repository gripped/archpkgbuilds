# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=uvicorn
pkgver=0.30.3
pkgrel=1
pkgdesc='The lightning-fast ASGI server'
arch=(any)
url=https://github.com/encode/uvicorn
license=(BSD)
depends=(
  python
  python-asgiref
  python-click
  python-h11
  python-httptools
  python-uvloop
  python-websockets
)
makedepends=(
  git
  python-build
  python-hatchling
  python-installer
)
source=(git+https://github.com/encode/uvicorn#tag=$pkgver)
b2sums=('049530303dc2ef74b86240feb707b61915827fa617a93edb1015a69fc7a536294d6ecd36601e8caf2921eca42b21daa1ba9cd45101f4c9621f5c75fa3c974114')

pkgver() {
  cd uvicorn
  git describe --tags
}

build() {
  cd uvicorn
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" uvicorn/dist/*.whl
  install -Dm 644 uvicorn/LICENSE.md -t "${pkgdir}"/usr/share/licenses/uvicorn/
}

# vim:set ts=2 sw=2 et:
