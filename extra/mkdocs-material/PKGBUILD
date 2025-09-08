# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=mkdocs-material
pkgver=9.6.19
pkgrel=1
pkgdesc="Documentation that simply works"
arch=(any)
url="https://github.com/squidfunk/mkdocs-material"
license=(ISC)
depends=(
  mkdocs
  python
  python-babel
  python-backrefs
  python-colorama
  python-jinja
  python-markdown
  # python-paginate # Not packaged
  python-requests
  python-yaml
)
makedepends=(
  python-build
  python-hatch-nodejs-version
  python-hatch-requirements-txt
  python-hatchling
  python-installer
  python-wheel
)
optdepends=(
  'python-cairosvg: for image processing'
  'python-pillow: for image processing'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6ec40f9f722df2b8f752a7943fb2f84ffaeb07d86285a7d047973f0e6d1a02c4')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
