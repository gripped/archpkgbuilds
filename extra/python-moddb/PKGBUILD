# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@tutanota.com>

pkgname=python-moddb
pkgver=0.14.0
pkgrel=2
pkgdesc='A Python scraper to access ModDB mods, games and more as objects'
arch=(any)
url=https://github.com/ClementJ18/moddb
license=('MIT')
depends=(
  python-beautifulsoup4
  python-requests
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
_tag=00827d38571ca0f7569f839e3096aa33468fd51b
source=(git+https://github.com/ClementJ18/moddb.git#tag=${_tag})
b2sums=('c5dd9e41d702092e05fa9ea18c9a21b78314f46b597740127549dcd1bcb71ff0b29402296b390a420ca93355b6cb071db45cd8a237db94d5f20fea27fdbe4eca')

pkgver() {
  cd moddb
  git describe --tags | sed 's/^v//'
}

build() {
  cd moddb
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" moddb/dist/*.whl
  install -Dm 644 moddb/LICENSE -t "${pkgdir}"/usr/share/licenses/python-moddb/
}

# vim: ts=2 sw=2 et:
