# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=python-pylast
pkgver=7.0.0
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
_tag=b95a694b6af9cc8f8279e03c5b859cc0bd5dff52
source=(git+https://github.com/pylast/pylast.git#tag=${_tag})
b2sums=('1bc52fd97ebfefe07b8269eb6fcc5790133880436f6e16a299dff076d782f5b97ce028dc88394ad14dc1641617d456559d1b66d6322ac48f89f2c36d40d8353c')

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
