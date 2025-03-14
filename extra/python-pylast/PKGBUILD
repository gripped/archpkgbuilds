# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=python-pylast
pkgver=5.5.0
pkgrel=1
pkgdesc='A Python interface to Last.fm and Libre.fm'
arch=(any)
url='https://github.com/pylast/pylast'
license=(Apache)
depends=(
  python-httpx
)
makedepends=(
  git
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
)
_tag=ccd42e40a3869d1e36a3809251f4785319242f74
source=(git+https://github.com/pylast/pylast.git#tag=${_tag})
b2sums=('819cd4b83e6a39ae8ea395bce301939c6e651a96eac3dddfffa1e246ce6273d35703074befb94b88673e7e97e2c8f17d9efaaf07bf2ae762e3516f19a29cb4de')

pkgver() {
  cd pylast
  git describe --tags
}

build() {
  cd pylast
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" pylast/dist/*.whl
}

# vim: ts=2 sw=2 et:
